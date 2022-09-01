//
//  HomeViewController.swift
//  NetflixMVVM
//
//  Created by Deco Stiefano on 24/08/22.
//

import UIKit

class HomeViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    
    private var randomTrendingMovies: Title?
    let headerView = HeroHeaderUIView().loadNib() as! HeroHeaderUIView
    let sectionTitles: [String] = ["Trending Movies", "Popular", "Trending TV", "Upcoming Movies", "Top Rated"]
    let viewModels = ViewModels()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        setupTable()
        setupNavBar()
        configureHeroHeaderView()
        
    }
    
    //MARK: Setup table
    private func setupTable() {
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(UINib(nibName: String(describing: CollectionViewTableViewCell.self), bundle: nil), forCellReuseIdentifier: CollectionViewTableViewCell.cellID)
        tableView.rowHeight = 350 // height / tinggi dinamis
        headerView.frame = CGRect(x: 0, y: 0, width: view.bounds.width, height: 600)
        tableView.tableHeaderView = headerView
        
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
    
    private func configureHeroHeaderView() {
        
        viewModels.configureHeroHeaderView { title, titleViewModel in
            guard let vm = titleViewModel else {return}
            self.randomTrendingMovies = title
            self.headerView.configure(with: vm)
        }
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
            viewModels.getTrendingMovie { titles in
                cell.configure(with: titles)
            }
            
        case Sections.TrendingTv.rawValue:
            viewModels.getTrendingTvs { titles in
                cell.configure(with: titles)
            }
            
        case Sections.Popular.rawValue:
            viewModels.getPopular { titles in
                cell.configure(with: titles)
            }
        
        case Sections.Upcoming.rawValue:
            viewModels.getUpcomingMovies { titles in
                cell.configure(with: titles)
            }
            
        case Sections.TopRated.rawValue:
            viewModels.getTopRater { titles in
                cell.configure(with: titles)
            }
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



