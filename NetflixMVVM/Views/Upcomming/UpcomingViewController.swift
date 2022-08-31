//
//  UpcomingViewController.swift
//  NetflixMVVM
//
//  Created by Jerry Purnama Maulid on 24/08/22.
//

import UIKit
#warning("isi data search")
class UpcomingViewController: UIViewController {
    
    
    private var titles: [Title] = [Title] ()
    
    private var upcomingTable: UITableView = {
       
        let table = UITableView()
        table.register(TitleTableViewCell.self, forCellReuseIdentifier: TitleTableViewCell.identifier)
        return table
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

       
    }

}
