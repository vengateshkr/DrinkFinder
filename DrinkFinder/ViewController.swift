//
//  ViewController.swift
//  DrinkFinder
//
//  Created by Mobility1 on 7/10/18.
//  Copyright © 2018 Mobility1. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource,UICollectionViewDataSource {
    
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
            return 300
        }
         else {
            return 70
        }
    }
    
    private func tableView(_ tableView: UITableView,
                            willDisplayCell cell: UITableViewCell,
                            forRowAtIndexPath indexPath: NSIndexPath) {
        
        guard let tableViewCell = cell as? TableViewCell else { return }
        
        tableViewCell.setCollectionViewDataSourceDelegate(dataSourceDelegate: self, forRow: indexPath.row)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell : TableViewCell = TableViewCell(style: .default, reuseIdentifier: "cell")
        cell.backgroundColor = .gray
        cell.collectionView = DrinkFinderCollectionView(targetView: cell)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.leftAnchor.constraint(equalTo: cell.leftAnchor).isActive = true
        collectionView.topAnchor.constraint(equalTo: cell.topAnchor).isActive = true
        collectionView.bottomAnchor.constraint(equalTo: cell.bottomAnchor).isActive = true
        collectionView.rightAnchor.constraint(equalTo: cell.rightAnchor).isActive = true
        collectionView.backgroundColor = .white
        return cell
    }

}


class TableViewCell: UITableViewCell {
    
    @IBOutlet weak var collectionView: DrinkFinderCollectionView!
    
    
    func setCollectionViewDataSourceDelegate
        <D: UICollectionViewDataSource & UICollectionViewDelegate>
        (dataSourceDelegate: D, forRow row: Int) {
        
        collectionView.delegate = dataSourceDelegate
        collectionView.dataSource = dataSourceDelegate
        collectionView.tag = row
       // collectionView.reloadData()
    }
}


