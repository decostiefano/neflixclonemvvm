//
//  TitleCollectionViewCell.swift
//  NetflixMVVM
//
//  Created by Jerry Purnama Maulid on 24/08/22.
//

import UIKit
import SDWebImage

class TitleCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var posterImageView: UIImageView!
    static let cellID = "cellIDCollection"

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    public func configure(with model: String) {
       
        guard let url  = URL(string: "https://image.tmdb.org/t/p/w500/\(model)") else {
            return
        }
        
        posterImageView.sd_setImage(with: url, completed: nil)
    }

}
