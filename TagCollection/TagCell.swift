//
//  TagCell.swift
//  TagCollection
//
//  Created by 逸唐陳 on 2019/1/4.
//  Copyright © 2019 逸唐陳. All rights reserved.
//

import UIKit

struct Tag {
    let name: String
    var selected: Bool = false
}

class TagCell: UICollectionViewCell {
    
    let nameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        label.textColor = UIColor(red: 214/255, green: 124/255, blue: 98/255, alpha: 1)
        label.textAlignment = .center
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .white
        self.layer.cornerRadius = 17
        self.layer.borderWidth = 1
        self.layer.borderColor = UIColor(red: 214/255, green: 124/255, blue: 98/255, alpha: 1).cgColor
        contentView.addSubview(nameLabel)
        nameLabel.widthAnchor.constraint(greaterThanOrEqualToConstant: 30).isActive = true
        nameLabel.widthAnchor.constraint(lessThanOrEqualToConstant: 150).isActive = true
        nameLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 8).isActive = true
        nameLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -8).isActive = true
        nameLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8).isActive = true
        nameLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -8).isActive = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
