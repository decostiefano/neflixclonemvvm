//
//  Extension+UIView.swift
//  NetflixMVVM
//
//  Created by Deco Stiefano on 24/08/22.
//

import UIKit

extension UIView {
    
    //MARK: Untuk load NIB/ UIView di controller
    func loadNib() -> UIView {
        let bundle = Bundle(for: type(of: self))
        let nibName = type(of: self).description().components(separatedBy: ".").last!
        let nib = UINib(nibName: nibName, bundle: bundle)
        return nib.instantiate(withOwner: self, options: nil).first as! UIView
    }
}
