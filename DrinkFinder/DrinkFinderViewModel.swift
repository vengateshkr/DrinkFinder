//
//  Constants.swift
//  DMOnBoarding
//
//  Created by Venkatesh on 08/07/18.
//  Copyright © 2018 Venkatesh. All rights reserved.
//

import Foundation

class DrinkFinderViewModel {
    
    let apiService: APIServiceProtocol
    var isAllowSegue: Bool = false
    
    var reloadTableViewClosure: (()->())?
    var showAlertClosure: (()->())?
    var updateLoadingStatus: (()->())?
    
    var drinkFinderModel : DrinkFinderModel! {
        didSet {
            self.reloadTableViewClosure?()
        }
    }
    
    var isFetched: Bool = false
    
    var numberOfOccassionsCells: Int? {
        guard let drinkFinderModel = drinkFinderModel else { return 0 }
        return drinkFinderModel.occasions.count
    }
    
    var numberOfProductsCells: Int? {
        guard let drinkFinderModel = drinkFinderModel else { return 0 }
        return drinkFinderModel.products.count
    }
    
    var isLoading: Bool = false {
        didSet {
            self.updateLoadingStatus?()
        }
    }
    
    var alertMessage: String? {
        didSet {
            self.showAlertClosure?()
        }
    }
    
    init( apiService: APIServiceProtocol = APIService()) {
        self.apiService = apiService
    }
    
    func initFetch() {
        self.isLoading = true
        apiService.fetchPopularPhoto { [weak self] (success, drinkFinderModel, error) in
            self?.isLoading = false
            if let error = error {
                self?.alertMessage = error.rawValue
            } else {
                self?.fetchedData(drinkFinderModel)
            }
        }
    }
    
    func fetchedData (_ obj : DrinkFinderModel) {
        self.drinkFinderModel = obj
    }
    
    func getOccasionsViewModel( at indexPath: IndexPath ) -> String {
        return  self.drinkFinderModel.occasions[indexPath.item].title
    }
    
    func getProductsModelViewModel( at indexPath: IndexPath ) -> String {
        return  self.drinkFinderModel.products[indexPath.item].title
    }
    
    deinit {
        print("deinit view model")
    }
}

