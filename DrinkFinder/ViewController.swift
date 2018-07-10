//
//  ViewController.swift
//  DrinkFinder
//
//  Created by Mobility1 on 7/10/18.
//  Copyright © 2018 Mobility1. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    var collectionView : DrinkFinderCollectionView!
    
    lazy var drinkFinderTableView : UITableView = {
        let tableView = UITableView(frame: self.view.frame)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    //MARK: - View lifecycle method
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(drinkFinderTableView)
        //drinkFinderTableView.isScrollEnabled = false
        drinkFinderTableView.rowHeight = UITableViewAutomaticDimension
        drinkFinderTableView.estimatedRowHeight = 300
        drinkFinderTableView.separatorStyle = .none
        drinkFinderTableView.tableFooterView = UIView(frame: .zero)
        drinkFinderTableView.leftAnchor.constraint(equalTo: self.view.leftAnchor).isActive = true
        drinkFinderTableView.rightAnchor.constraint(equalTo: self.view.rightAnchor).isActive = true
        drinkFinderTableView.topAnchor.constraint(equalTo: self.view.topAnchor).isActive = true
        drinkFinderTableView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor).isActive = true
        // Do any additional setup after loading the view, typically from a nib.
        

    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //MARK: - TableView delegate and datasource method
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        if section == 0 {
            let drinkView = DrinkFinderHeaderView("Occassion")
            return drinkView
        }
        if section == 1 {
            let drinkView = DrinkFinderHeaderView("Products")
            return drinkView
        }
        return nil
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 40
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 0 {
            return 350
        }
         else {
            return 120
        }
    }
    

    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let tableViewCell = TableViewCell(style: .default, reuseIdentifier: "cell")
        print(indexPath.section)
        tableViewCell.tag = indexPath.section
        tableViewCell.backgroundColor = .gray
        tableViewCell.collectionView = DrinkFinderCollectionView( tableViewCell)
        tableViewCell.collectionView.tag = indexPath.section
        tableViewCell.collectionView.translatesAutoresizingMaskIntoConstraints = false
        tableViewCell.collectionView.leftAnchor.constraint(equalTo: tableViewCell.leftAnchor).isActive = true
        tableViewCell.collectionView.topAnchor.constraint(equalTo: tableViewCell.topAnchor).isActive = true
        tableViewCell.collectionView.bottomAnchor.constraint(equalTo: tableViewCell.bottomAnchor).isActive = true
        tableViewCell.collectionView.rightAnchor.constraint(equalTo: tableViewCell.rightAnchor).isActive = true
        tableViewCell.collectionView.backgroundColor = .white
        return tableViewCell
    }

}


class TableViewCell: UITableViewCell {
    
     var collectionView: DrinkFinderCollectionView!
    
   
}


