//
//  DrinkFinderCollectionView.swift
//  DrinkFinder
//
//  Created by Mobility1 on 7/10/18.
//  Copyright © 2018 Mobility1. All rights reserved.
//

import UIKit

class DrinkFinderCollectionView: UICollectionView, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    var viewModel : DrinkFinderViewModel = {
        return DrinkFinderViewModel()
    }()
    
    let cellId : String = "cell"
    
    init(_ targetView : UIView, _ tag : Int ) {
        super.init(frame: UIScreen.main.bounds, collectionViewLayout: UICollectionViewFlowLayout())
        
        self.delegate = self
        self.dataSource = self
        
        self.tag = tag
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        
        if (tag == 0) {
            layout.scrollDirection = .vertical
            //layout.sectionInset = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10)
            layout.minimumInteritemSpacing = 3
            layout.minimumLineSpacing = 3
            self.isScrollEnabled = false
        }
        else {
            layout.scrollDirection = .horizontal
        }
        layout.sectionInset = UIEdgeInsets(top: 5, left: 10, bottom: 0, right: 10)
        self.collectionViewLayout = layout
        targetView.addSubview(self)
        self.register(DrinkFinderCollectionViewCell.self, forCellWithReuseIdentifier: cellId)
        
        self.viewModel.reloadTableViewClosure = { [weak self] () in
            DispatchQueue.main.async {
                self?.reloadData()
            }
        }
        
        if !viewModel.isFetched {
            self.viewModel.initFetch()
            viewModel.isFetched = true
        }
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView.tag == 0 {
            return self.viewModel.numberOfOccassionsCells!
        } else {
            return self.viewModel.numberOfProductsCells!
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize
    {
        if collectionView.tag == 0 {
            return CGSize(width: (collectionView.frame.width - 26)/3, height: (collectionView.frame.height - 10) / 3 )
        }
        else {
            return CGSize(width: (collectionView.frame.width - 26)/3, height: collectionView.frame.height - 10)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell : DrinkFinderCollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! DrinkFinderCollectionViewCell
        if collectionView.tag == 0 {
            cell.label.text = viewModel.getOccasionsViewModel(at: indexPath)
        }
        else {
            cell.label.text = viewModel.getProductsModelViewModel(at: indexPath)
        }
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
        
        // self.contentView.translatesAutoresizingMaskIntoConstraints = false
        
        self.imageView = UIImageView()
        self.addSubview(imageView)
        self.imageView.backgroundColor = .gray
        self.imageView.translatesAutoresizingMaskIntoConstraints = false
        self.imageView.widthAnchor.constraint(equalToConstant : 80).isActive = true
        self.imageView.heightAnchor.constraint(equalToConstant : 80).isActive = true
        self.imageView.setNeedsLayout()
        self.imageView.layoutIfNeeded()
        self.imageView.layer.cornerRadius = self.imageView.frame.width / 2.0
        
        
        self.label = UILabel()
        self.addSubview(label)
        self.label.backgroundColor = .white
        self.label.translatesAutoresizingMaskIntoConstraints = false
        self.label.textAlignment = .center
        self.label.text = "christmas"
        
        let stackView = UIStackView(arrangedSubviews: [imageView,label])
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.alignment = .center
        stackView.spacing = 0
        stackView.axis = .vertical
        stackView.distribution = .fill
        self.addSubview(stackView)
        
        stackView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        stackView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        stackView.leftAnchor.constraint(equalTo: self.leftAnchor).isActive = true
        stackView.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
        
        self.label.leftAnchor.constraint(equalTo: stackView.leftAnchor).isActive = true
        self.label.rightAnchor.constraint(equalTo: stackView.rightAnchor).isActive = true
        
    }
}
