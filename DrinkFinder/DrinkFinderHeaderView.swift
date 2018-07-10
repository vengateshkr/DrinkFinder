//
//  DrinkFinderHeaderView.swift
//  DrinkFinder
//
//  Created by Mobility1 on 7/10/18.
//  Copyright © 2018 Mobility1. All rights reserved.
//

import UIKit

class DrinkFinderHeaderView: UIView {
    
    init(_ str : String) {
        super.init(frame: UIScreen.main.bounds)
        
        //self.translatesAutoresizingMaskIntoConstraints = false
        
        let leftLabel = UILabel()
        leftLabel.text = "  _____________ "
        leftLabel.textColor = .gray
        leftLabel.textAlignment = .center

        let stringLabel = UILabel()
        stringLabel.text = str
        stringLabel.textAlignment = .center
        
        let rightLabel = UILabel()
        rightLabel.text = "  _____________ "
        rightLabel.textColor = .gray
        rightLabel.textAlignment = .center

        let stackView = UIStackView(arrangedSubviews: [leftLabel,stringLabel,rightLabel])
        stackView.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(stackView)
        stackView.alignment = .fill
        stackView.spacing = 0
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        
        stackView.leftAnchor.constraint(equalTo: self.leftAnchor).isActive = true
        stackView.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
        stackView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        stackView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    /*
     // Only override draw() if you perform custom drawing.
     // An empty implementation adversely affects performance during animation.
     override func draw(_ rect: CGRect) {
     // Drawing code
     }
     */
    
}
