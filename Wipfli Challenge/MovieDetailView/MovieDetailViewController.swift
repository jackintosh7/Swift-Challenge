//
//  MovieDetailViewController.swift
//  Wipfli Challenge
//
//  Created by Jack Higgins on 1/28/21.
//

import UIKit

class MovieDetailViewController: UIViewController {
  
    private let repo = MovieRepository()
    var movie: MovieModel?
    
    var posterImageView: UIImageView!
    var averageRating: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor.white
        
        if let movie = self.movie {
            self.title = movie.title
            self.fetchMovieByID(id: movie.id)
        }
    }
    
    //TODO: Configure Detail View
    func setView() {
        guard let movie = self.movie else { return }
       
        // TODO: Configure remaining fields
        // Set Poster Image View
        // Find average rating from Movie -
        // Finish function (calculateMovieAverage) on MovieModel that takes ratings [RatingsModel] and returns the average rating
        
        if let ratings = movie.ratings {
           print(movie.calculateMovieAverage(ratings: ratings))
        } else {
            // No rating data
        }
    }
    
    func fetchMovieByID(id: String) {
        //TODO: LOADING INDICATOR
        repo.fetchByID(id: id) { result in
            switch result {
            case .success(let movie):
                self.movie = movie
                self.setView()
            //TODO: DISMISS LOADING INDICATOR
            case .failure(let error):
                //TODO: Handle Error, display to user
                //TODO: DISMISS LOADING INDICATOR
                print(error)
            }
        }
    }
}
