//
//  TitlePreviewViewController.swift
//  NetflixMVVM
//
//  Created by Deco Stiefano on 31/08/22.
//

import UIKit
import WebKit

class TitlePreviewViewController: UIViewController {
 
    @IBOutlet weak var subView: UIView!
    @IBOutlet weak var titleLabel: UILabel?
    @IBOutlet weak var overviewLabel: UILabel?
    @IBOutlet weak var downloadButon: UIButton!
    
    private let webView: WKWebView =  {
       let webView = WKWebView()
        webView.translatesAutoresizingMaskIntoConstraints = false
        return webView
        
    }()
    
    var model: TitlePreviewViewModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Preview Movie"
        view.backgroundColor = .systemBackground

        setupWebView()
        configure(with: model)
    }
    
    
    private func setupWebView() {
        downloadButon.layer.cornerRadius = 5
        webView.frame = CGRect(x: 0, y: 0, width: view.frame.width, height: subView.frame.height)
        subView.addSubview(webView)
    }
    
    func configure(with bindingModel: TitlePreviewViewModel?) {
        guard let model = bindingModel else {
            return
        }
        guard let url = URL(string: "https://www.youtube.com/embed/\(model.youtubeView.id.videoId)") else {
            return
        }
        
        titleLabel?.text = model.title
        overviewLabel?.text = model.titleOverview
        webView.load(URLRequest(url: url))
    }
    
}
