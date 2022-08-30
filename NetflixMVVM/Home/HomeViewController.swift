//
//  HomeViewController.swift
//  NetflixMVVM
//
//  Created by Jerry Purnama Maulid on 24/08/22.
//

import UIKit

class HomeViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    
    let sectionTitles: [String] = ["Trending Movies", "Popular", "Trending TV", "Upcoming Movies", "Top Rated"]
    let viewModels = ViewModels()
    let titleItem = TItleItem()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        setupTable()
        setupNavBar()
        setupHeaderTable()
        
    }
    
    //MARK: Setup table
    private func setupTable() {
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(UINib(nibName: String(describing: CollectionViewTableViewCell.self), bundle: nil), forCellReuseIdentifier: CollectionViewTableViewCell.cellID)
        tableView.rowHeight = UITableView.automaticDimension // height / tinggi dinamis
        
    }
    
    //MARK: Setup Navigation
    private func setupNavBar() {
        var image = UIImage(named: "netflixLogoSmall")
        image = image?.withRenderingMode(.alwaysOriginal)
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: image, style: .done, target: self, action: nil)
        
        navigationItem.rightBarButtonItems = [
            UIBarButtonItem(image: UIImage(systemName: "person"), style: .done, target: self, action: nil),
            UIBarButtonItem(image: UIImage(systemName: "play.rectangle"), style: .done, target: self, action: nil)
        ]
        navigationController?.navigationBar.tintColor = .white
    }
   
    //MARK: Setup Header table
    private func setupHeaderTable() {
        let header = HeroHeaderUIView().loadNib() as! HeroHeaderUIView
        tableView.tableHeaderView = header
        
    }
}


extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    
    //MARK: Banyak Section
    func numberOfSections(in tableView: UITableView) -> Int {
        return sectionTitles.count
    }
    
    //MARK: Total banyak items / Count Datasource
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    
    //MARK: Isi cell items / Data source
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CollectionViewTableViewCell.cellID, for: indexPath) as! CollectionViewTableViewCell
        
        
        switch indexPath.section {
        case Sections.TrendingMovies.rawValue:
            cell.collectionView.backgroundColor = .clear
            
        case Sections.TrendingTv.rawValue:
            cell.collectionView.backgroundColor = .clear
            
        case Sections.Popular.rawValue:
            cell.collectionView.backgroundColor = .clear
        
        case Sections.Upcoming.rawValue:
            cell.collectionView.backgroundColor = .clear
            
        case Sections.TopRated.rawValue:
            cell.collectionView.backgroundColor = .clear
        default:
            cell.collectionView.backgroundColor = .clear
            
        }
        
        
        return cell
    }
    
    
    //MARK: Header
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 40
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return sectionTitles[section]
    }
    
    
    //MARK: Will display / fungsinya untuk menampikaan yang akan di tampilkan saat scroll
    func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        guard let header = view as? UITableViewHeaderFooterView else {return}
        header.textLabel?.font = .systemFont(ofSize: 18, weight: .semibold)
        header.textLabel?.frame = CGRect(x: header.bounds.origin.x + 20, y: header.bounds.origin.y, width: 100, height: header.bounds.height)
        header.textLabel?.textColor = .white
        header.textLabel?.text = header.textLabel?.text
    }
    
}



