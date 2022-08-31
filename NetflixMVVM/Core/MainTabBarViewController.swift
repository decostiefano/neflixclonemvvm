//
//  MainTabBarViewController.swift
//  NetflixMVVM
//
//  Created by Jerry Purnama Maulid on 22/08/22.
//

import UIKit

#warning("Isi yang kosong")
class MainTabBarViewController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let home = UINavigationController(rootViewController: HomeViewController())
        let coming = UINavigationController(rootViewController: UpcomingViewController())
        let search = UINavigationController(rootViewController: SearchViewController())
        let download = UINavigationController(rootViewController: DownloadsViewController()) 

        
        home.tabBarItem.image = UIImage(systemName: "house")
        coming.tabBarItem.image = UIImage(systemName: "play.circle")
        search.tabBarItem.image = UIImage(systemName: "magnifyingglass")
        download.tabBarItem.image = UIImage(systemName: "arrow.down.to.line")
        
        home.title = "Home"
        coming.title = "Coming Soon"
        search.title = "Search"
        download.title = "Downloads"
        
        
        tabBar.tintColor = .label
        
        setViewControllers([home, coming, search, download], animated: true)
        
    }
}

