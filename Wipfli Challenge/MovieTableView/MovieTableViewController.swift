//
//  MovieTableViewController.swift
//  Wipfli Challenge
//
//  Created by Jack Higgins on 1/28/21.
//

import UIKit

class MovieTableViewController: UIViewController {
    
    var searchController: UISearchController!
    var tableView: UITableView = UITableView()
    
    private let repo = MovieRepository()
    var movies = Array<MovieModel>()
    var page = 1
    var totalResults = 0
    var searchText: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let barHeight: CGFloat = UIApplication.shared.statusBarFrame.size.height
        let displayWidth: CGFloat = self.view.frame.width
        let displayHeight: CGFloat = self.view.frame.height
        
        tableView = UITableView(frame: CGRect(x: 0, y: barHeight, width: displayWidth, height: displayHeight - barHeight))
        let nib = UINib(nibName: "MovieTableViewCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "cell")
        tableView.dataSource = self
        tableView.delegate = self
        self.view.addSubview(tableView)
        
        searchController = UISearchController(searchResultsController: nil)
        searchController.searchResultsUpdater = self
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.sizeToFit()
        
        tableView.tableHeaderView = searchController.searchBar
        definesPresentationContext = true
        self.view.backgroundColor = UIColor.white
        self.title = "Search Movies"
    }
}

extension MovieTableViewController: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        self.searchText = searchController.searchBar.text
        if let searchText = searchController.searchBar.text {
            if searchText.count >= 3 {
                //TODO: SET LOADING INDICATOR
                self.clearMovies()
                self.loadMovies()
            } else {
                self.clearMovies()
            }
        }
    }
}

private extension MovieTableViewController {
    func loadMovies() {
        if let searchText = self.searchText {
            repo.searchByTitle(title: searchText, page: String(page)) { result in
                switch result {
                case .success(let movieData):
                    self.totalResults = movieData.totalResults
                    self.movies.append(contentsOf: movieData.movies)
                    self.tableView.reloadData()
                //TODO: DISMISS LOADING INDICATOR
                case .failure(let error):
                    //TODO: DISMISS LOADING INDICATOR
                    //TODO: Show no results indicator
                    //TODO: Handle other errors such as API call failures,
                    //loss of network connectivity
                    print(error)
                }
            }
        }
    }
    
    func clearMovies() {
        self.movies.removeAll()
        self.tableView.reloadData()
        self.page = 1
    }
}

extension MovieTableViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let movie = self.movies[indexPath.row]
        let vc = MovieDetailViewController()
        vc.movie = movie
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.movies.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! MovieTableViewCell
        let movie = self.movies[indexPath.row]
        cell.setMovie(movie: movie)
        
        if indexPath.row == movies.count - 1 { // last cell
            if movies.count != totalResults {
                self.page += 1
                self.loadMovies()
            }
        }
        return cell
    }
}
