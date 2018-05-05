//
//  FilterCollectionViewCell.swift
//  personaltrainer
//
//  Created by Jason Jung on 4/26/18.
//  Copyright © 2018 Jason Jung. All rights reserved.
//

import UIKit

class FilterCollectionViewCell: UICollectionViewCell {
    
    
    var filterLabel: UILabel!
    
    
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.backgroundColor = UIColor(white: 0.9, alpha: 1)
        
        filterLabel = UILabel()
        filterLabel.translatesAutoresizingMaskIntoConstraints = false
        filterLabel.font = UIFont.systemFont(ofSize: 15.0)
        filterLabel.textColor = .black
        filterLabel.textAlignment = NSTextAlignment.center
        
        contentView.addSubview(filterLabel)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //Update constraints as normal
    override func updateConstraints() {
        
        NSLayoutConstraint.activate([
            filterLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            filterLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            filterLabel.widthAnchor.constraint(equalToConstant: 96)
            ])
        
        
        //Don't forget to call the super. This is calling the updateConstraints function of the superclass
        super.updateConstraints()
    }
    
}
