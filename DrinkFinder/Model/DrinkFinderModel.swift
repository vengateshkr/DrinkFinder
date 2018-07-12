//
//  Event.swift
//  MVVMPlayground
//
//  Created by Neo on 01/10/2017.
//  Copyright © 2017 ST.Huang. All rights reserved.
//

import Foundation

struct DrinkFinderModel: Codable {
    let occasions : [OccasionsModel]
    let products : [ProductsModel]
}

struct OccasionsModel: Codable {
    let title : String
    let image : String
}

struct ProductsModel: Codable {
    let title : String
    let image : String
}
