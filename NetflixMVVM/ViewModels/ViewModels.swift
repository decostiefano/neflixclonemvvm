//
//  ViewModels.swift
//  NetflixMVVM
//
//  Created by Jerry Purnama Maulid on 24/08/22.
//

import UIKit

public class ViewModels {
    
    var titles: [Title] = [Title]()
    
    
    //MARK: Header
    func configureHeroHeaderView(completion: @escaping (Title?, TitleViewModel?) -> Void) {
        
        APICaller.shared.getTrendingMovies { result in
            switch result {
            case .success(let titles):
                let selectedTitle = titles.randomElement()
                let titleViewModel = TitleViewModel(titleName: selectedTitle?.original_title ?? "", posterURL: selectedTitle?.poster_path ?? "")
                completion(selectedTitle, titleViewModel)
                
            case.failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    //MARK: Trending
    
    func getTrendingMovie(completion: @escaping ([Title])-> Void) {
        APICaller.shared.getTrendingMovies { result in
            switch result {
            case .success(let titles):
                completion(titles)
                
            case.failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    //MARK: Upcoming movie
    func getUpcomingMovies(completion: @escaping ([Title])-> Void) {
        
        APICaller.shared.getUpcomingMovies { result in
            switch result {
            case .success(let titles):
                completion(titles)
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    
    //MARK: Trending TV
    func getTrendingTvs(completion: @escaping ([Title])-> Void) {
        
        APICaller.shared.getTrendingTvs { result in
            switch result {
            case .success(let titles):
                completion(titles)
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    
    //MARK: Get Popular
    func getPopular(completion: @escaping ([Title]) -> Void) {
        
        APICaller.shared.getPopular { result in
            switch result {
            case .success(let titles):
                completion(titles)
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    
    //MARK: Get Top Rated
    func getTopRater(completion: @escaping ([Title]) -> Void) {
        
        APICaller.shared.getTopRated { result in
            switch result {
            case .success(let titles):
                completion(titles)
            case .failure(let error):
                print(error)
            }
        }
    }
    
    
    //MARK: Fetch UpComing
    
    func fetchUpcoming(completion: @escaping ([Title])-> Void) {
        APICaller.shared.getUpcomingMovies { result in
            switch result {
            case .success(let titles):
                completion(titles)
            case .failure(let error):
                print(error.localizedDescription)
                
            }
        }
    }
    
    func fetchUpcoming() {
        APICaller.shared.getUpcomingMovies { [weak self] result in
            switch result {
            case .success(let titles):
                self?.titles = titles
            
                
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    
    func fetchDiscoverMovies() {
        // viewmodels
        APICaller.shared.getDiscoverMovie { [weak self] result in
            switch result {
            case .success(let titles):
                self?.titles = titles
                
            case . failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    func getMovie(titleName: String, completion: @escaping (VideoElement) -> Void) {
        APICaller.shared.getMovie(with: titleName) { result in
            switch result {
            case .success(let videoElement):
                completion(videoElement)
                
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
}
