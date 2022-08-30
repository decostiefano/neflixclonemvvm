//
//  CollectionViewTableViewCell.swift
//  NetflixMVVM
//
//  Created by Jerry Purnama Maulid on 24/08/22.
//

import UIKit

class CollectionViewTableViewCell: UITableViewCell {
    static let cellID = "cellID"
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupCollection()
    }
    
    private func setupCollection() {
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(UINib(nibName: String(describing: TitleCollectionViewCell.self), bundle: nil), forCellWithReuseIdentifier: TitleCollectionViewCell.cellID)
    }
    
}

extension CollectionViewTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: TitleCollectionViewCell.cellID, for: indexPath) as! TitleCollectionViewCell
        cell.backgroundColor = .blue
        return cell
    }
}
