//
//  HeroHeaderUIView.swift
//  NetflixMVVM
//
//  Created by Jerry Purnama Maulid on 24/08/22.
//

import UIKit
import SDWebImage

class HeroHeaderUIView: UIView {

    @IBOutlet weak var downloadButton: UIButton!
    @IBOutlet weak var playButton: UIButton!
    @IBOutlet weak var imageViewHeader: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupButton()
        
    }
    
    private func setupButton() {
        playButton.layer.borderColor = UIColor.white.cgColor
        playButton.layer.borderWidth = 1
        playButton.layer.cornerRadius = 10
    }
    
    public func configure(with model: TitleViewModel) {
        guard let url  = URL(string: "https://image.tmdb.org/t/p/w500/\(model.posterURL)") else {
            return
        }

        imageViewHeader.sd_setImage(with: url, completed: nil )
    }
}
    



