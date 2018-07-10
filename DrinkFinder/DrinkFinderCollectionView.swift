//
//  DrinkFinderCollectionView.swift
//  DrinkFinder
//
//  Created by Mobility1 on 7/10/18.
//  Copyright © 2018 Mobility1. All rights reserved.
//

import UIKit

class DrinkFinderCollectionView: UICollectionView, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    let cellId : String = "cell"
    
    init(_ targetView : UIView) {
        super.init(frame: UIScreen.main.bounds, collectionViewLayout: UICollectionViewFlowLayout())
        
        print(self.tag)
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
        if collectionView.tag == 0 {
            return 7
        } else {
            return 3
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize
    {
        if collectionView.tag == 0 {
            return CGSize(width: (collectionView.frame.width - 26)/3, height: (collectionView.frame.height / 3) )
        }
        else {
            return CGSize(width: (collectionView.frame.width - 26)/3, height: collectionView.frame.height - 10)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell : DrinkFinderCollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! DrinkFinderCollectionViewCell
        cell.backgroundColor = .clear
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
        self.imageView = UIImageView()
        self.addSubview(imageView)
        self.imageView.backgroundColor = .gray
        self.imageView.translatesAutoresizingMaskIntoConstraints = false
        self.imageView.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        self.imageView.topAnchor.constraint(equalTo: self.topAnchor, constant : 5).isActive = true
        self.imageView.widthAnchor.constraint(equalToConstant : 80).isActive = true
        self.imageView.heightAnchor.constraint(equalToConstant : 80).isActive = true
        self.imageView.setNeedsLayout()
        self.imageView.layoutIfNeeded()
        self.imageView.layer.cornerRadius = self.imageView.frame.width / 2.0
        
        
        self.label = UILabel()
        self.addSubview(label)
        self.label.backgroundColor = .gray
        self.label.translatesAutoresizingMaskIntoConstraints = false
        self.label.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        self.label.topAnchor.constraint(equalTo: self.imageView.bottomAnchor, constant : 5).isActive = true
        self.label.widthAnchor.constraint(equalToConstant : self.frame.width).isActive = true
        self.label.heightAnchor.constraint(equalToConstant : 20).isActive = true
        self.label.textAlignment = .center
        self.label.text = "christmas"
        
    }
}
