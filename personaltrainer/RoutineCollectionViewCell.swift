//
//  RoutineCollectionViewCell.swift
//  personaltrainer
//
//  Created by Jason Jung on 4/26/18.
//  Copyright © 2018 Jason Jung. All rights reserved.
//

import UIKit

class RoutineCollectionViewCell: UICollectionViewCell {
    
    var nameLabel: UILabel!
    var lvlLabel: UILabel!
    var separator: UILabel!
    var goalLabel: UILabel!
    var details: UIImageView!
    var detailslink: URL!
    
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.backgroundColor = .gray
        nameLabel = UILabel()
        lvlLabel = UILabel()
        goalLabel = UILabel()
        separator = UILabel()
        details = UIImageView()
        

        
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(imageTapped(tapGestureRecognizer:)))
        details.isUserInteractionEnabled = true
        details.addGestureRecognizer(tapGestureRecognizer)
        
        details.image = UIImage(named: "details")
        details.contentMode = .scaleAspectFill
        details.layer.masksToBounds = true
        details.translatesAutoresizingMaskIntoConstraints = false
        
        contentView.clipsToBounds = true
        
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        lvlLabel.translatesAutoresizingMaskIntoConstraints = false
        goalLabel.translatesAutoresizingMaskIntoConstraints = false
        separator.translatesAutoresizingMaskIntoConstraints = false
        
        nameLabel.font = UIFont.boldSystemFont(ofSize: 16)
        lvlLabel.font = UIFont.systemFont(ofSize: 14.0)
        goalLabel.font = UIFont.systemFont(ofSize: 14.0)
        separator.font = UIFont.systemFont(ofSize: 14.0)
        
        separator.text = "|"
        
        nameLabel.textColor = .black
        lvlLabel.textColor = .black
        goalLabel.textColor = .blue
        separator.textColor = .black
        
        contentView.addSubview(nameLabel)
        contentView.addSubview(lvlLabel)
        contentView.addSubview(goalLabel)
        contentView.addSubview(separator)
        contentView.addSubview(details)
    }
    
    @objc func imageTapped(tapGestureRecognizer: UITapGestureRecognizer)
    {
        let tappedImage = tapGestureRecognizer.view as! UIImageView
        UIApplication.shared.open(detailslink)
        
    }

    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //Update constraints as normal
    override func updateConstraints() {

        NSLayoutConstraint.activate([
            details.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8),
            details.widthAnchor.constraint(equalToConstant: 32),
            details.heightAnchor.constraint(equalToConstant: 32),
            details.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -8)
            ])
        NSLayoutConstraint.activate([
            nameLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 4),
            nameLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 8),
            nameLabel.widthAnchor.constraint(equalToConstant: 160),
            nameLabel.heightAnchor.constraint(equalToConstant: nameLabel.intrinsicContentSize.height)
            ])
        NSLayoutConstraint.activate([
            lvlLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 4),
            lvlLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 8),
            lvlLabel.widthAnchor.constraint(equalToConstant: lvlLabel.intrinsicContentSize.width)
            ])
        NSLayoutConstraint.activate([
            separator.centerYAnchor.constraint(equalTo: lvlLabel.centerYAnchor),
            separator.leadingAnchor.constraint(equalTo: lvlLabel.trailingAnchor, constant: 4),
            separator.widthAnchor.constraint(equalToConstant: separator.intrinsicContentSize.width)
            ])
        NSLayoutConstraint.activate([
            goalLabel.centerYAnchor.constraint(equalTo: lvlLabel.centerYAnchor),
            goalLabel.leadingAnchor.constraint(equalTo: separator.trailingAnchor, constant: 4),
            goalLabel.widthAnchor.constraint(equalToConstant: goalLabel.intrinsicContentSize.width)
            ])
        
        
        //Don't forget to call the super. This is calling the updateConstraints function of the superclass
        super.updateConstraints()
    }
}

