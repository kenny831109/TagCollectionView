//
//  ViewController.swift
//  TagCollection
//
//  Created by 逸唐陳 on 2019/1/4.
//  Copyright © 2019 逸唐陳. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var tags: [Tag] = [Tag(name: "Sports", selected: false),
                       Tag(name: "Design", selected: false),
                       Tag(name: "Humor", selected: false),
                       Tag(name: "Music", selected: false),
                       Tag(name: "Education", selected: false),
                       Tag(name: "Edtech", selected: false),
                       Tag(name: "Love", selected: false),
                       Tag(name: "Food", selected: false),
                       Tag(name: "Poetry", selected: false),
                       Tag(name: "Women In Tech", selected: false),
                       Tag(name: "Female Founders", selected: false),
                       Tag(name: "Travel", selected: false),
                       Tag(name: "a", selected: false)]
    var sizingCell: TagCell?
    
    let tagView: UICollectionView = {
        let layout = FlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 8, left: 8, bottom: 8, right: 8)
        let view = UICollectionView(frame: CGRect.zero, collectionViewLayout: layout)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor.clear
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        sizingCell = TagCell()
        view.addSubview(tagView)
        tagView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        tagView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20).isActive = true
        tagView.heightAnchor.constraint(equalToConstant: 250).isActive = true
        tagView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        tagView.register(TagCell.self, forCellWithReuseIdentifier: "cell")
        tagView.delegate = self
        tagView.dataSource = self
    }

}

extension ViewController: UICollectionViewDelegateFlowLayout, UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return tags.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = tagView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! TagCell
        self.configureCell(cell, forIndexPath: indexPath)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        self.configureCell(self.sizingCell!, forIndexPath: indexPath)
        return self.sizingCell!.systemLayoutSizeFitting(UIView.layoutFittingCompressedSize)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        tagView.deselectItem(at: indexPath, animated: false)
        tags[indexPath.row].selected = !tags[indexPath.row].selected
        self.tagView.reloadData()
        let alert = UIAlertController(title: "", message: "\(tags[indexPath.item].name)", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        present(alert, animated: true, completion: nil)
    }
    
    func configureCell(_ cell: TagCell, forIndexPath indexPath: IndexPath) {
        let tag = tags[indexPath.row]
        cell.nameLabel.text = tag.name
//        cell.nameLabel.textColor = tag.selected ? UIColor.white : UIColor(red: 0.1, green: 0.1, blue: 0.1, alpha: 1)
//        cell.backgroundColor = tag.selected ? UIColor(red: 0, green: 1, blue: 0, alpha: 1) : UIColor(red: 0.8, green: 0.8, blue: 0.8, alpha: 1)
    }
    
}


