//
//  DrinkFinderCollectionView.swift
//  DrinkFinder
//
//  Created by Mobility1 on 7/10/18.
//  Copyright © 2018 Mobility1. All rights reserved.
//

import UIKit

class DrinkFinderCollectionView: UICollectionView,UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {

    let cellId : String = "cell"

    init(targetView : UIView) {
        super.init(frame: UIScreen.main.bounds, collectionViewLayout: UICollectionViewFlowLayout())
        self.delegate = self
        self.dataSource = self
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10)
        layout.minimumInteritemSpacing = 3
        layout.minimumLineSpacing = 3
        self.collectionViewLayout = layout
        targetView.addSubview(self)
        self.register(DrinkFinderCollectionViewCell.self, forCellWithReuseIdentifier: cellId)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if section == 0 { return 7}
        else {return 0 }
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize
    {
        print((collectionView.frame.width)/3  , collectionView.frame.height/3)
        return CGSize(width: (collectionView.frame.width - 26)/3, height: collectionView.frame.height / 3)

    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell : DrinkFinderCollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! DrinkFinderCollectionViewCell
        // cell.label.text = "20"
        cell.backgroundColor = .red
        print(cell.frame)
        return cell
    }
    
}


class DrinkFinderCollectionViewCell: UICollectionViewCell {
    
    var imageView : UIImageView!
    var label : UILabel!

    override init(frame: CGRect) {
        super.init(frame: frame)
        //self.frame = CGRect(x: 0, y: 0, width: 200, height: 200)

        addViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func addViews() {
    }
}
