//
//  TitleTableViewCell.swift
//  NetflixMVVM
//
//  Created by Deco Stiefano on 30/08/22.
//

import UIKit

class TitleTableViewCell: UITableViewCell {
    
    static let identifier = "TitleTableViewCell"

    @IBOutlet weak var titlePosterUIImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var playTitleButton: UIButton!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()

    }
    
    
}
    

