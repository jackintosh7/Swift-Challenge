//
//  MovieRepository.swift
//  Wipfli Challenge
//
//  Created by Jack Higgins on 1/27/21.
//

import Foundation
import RealmSwift

class MovieRepository {

    /// Search By Movie Title
    /// - Parameters:
    ///   - title: Title
    ///   - page: Page
    ///   - completion: Return array of MovieModels or return an error if faliure
    func searchByTitle(
        title: String,
        page: String,
        completion: @escaping (Result<MovieData, Error>) -> ()
    ) {
        let request = API.Movies.Search.Request(searchTerm: title, page: page)
        API.Movies.Search(request: request).invoke { result in
            switch result {
            case .success(let response):
                if let totalResults = Int(response.totalResults) {
                    let movieData = MovieData.init(movies: response.movies, totalResults: totalResults)
                    completion(.success(movieData))
                } else {
                    //TODO: Handle if unwrapping failed
                }
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    
    /// Fetch Movie By ID
    /// - Parameters:
    ///   - id: imdb ID
    ///   - completion: Return completed MovieModel or error if fali
    func fetchByID(
        id: String,
        completion: @escaping (Result<MovieModel, Error>) -> ()
    ) {
        let request = API.Movies.FetchByID.Request(id: id)
        API.Movies.FetchByID(request: request).invoke { result in
            switch result {
            case .success(let movie):
                do {
                    //Save full movie object in local database MovieDetailView -
                    //Check if movie is in local DB before query
                   try Realm().write { realm in
                      realm.add(movie, update: .modified)
                   }
                    completion(.success(movie))
                } catch {
                   completion(.failure(error))
                }
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}
