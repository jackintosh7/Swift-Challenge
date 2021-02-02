//
//  Wipfli_ChallengeTests.swift
//  Wipfli ChallengeTests
//
//  Created by Jack Higgins on 1/27/21.
//

import XCTest
@testable import Wipfli_Challenge

class Wipfli_ChallengeTests: XCTestCase {
    
    // Movie Repo Config
    private let repo = MovieRepository()
    
    // This test takes an imdbID and calls the fetchByID function,
    // should pass if title = Inception
    func testFetchMovieByID() {
        let inceptionMovieID = "tt1375666"
        var movie: MovieModel?
        var error: Error?
        let expectation = self.expectation(description: "FetchByID")
        
        repo.fetchByID(id: inceptionMovieID) { result in
            switch result {
            case .success(let movieResult):
                movie = movieResult
                expectation.fulfill()
            case .failure(let errorResult):
                error = errorResult
                expectation.fulfill()
            }
        }
        waitForExpectations(timeout: 5, handler: nil)
        XCTAssertEqual(movie?.title, "Inception", "Searched movie by ID is Inception")
        XCTAssertNil(error, "Error is nil")
    }
    
    // This test takes an confirmed title str and calls the searchByTitle function,
    // the results should be > 0
    func testSearchMovieByTitle() {
        let titleQuery = "Inception"
        var movieData: MovieData?
        var error: Error?
        let expectation = self.expectation(description: "SearchMovieByTitle")
        
        repo.searchByTitle(title: titleQuery, page: "1") { result in
            switch result {
            case .success(let data):
                movieData = data
                expectation.fulfill()
            case .failure(let errorResult):
                error = errorResult
                expectation.fulfill()
            }
        }
        waitForExpectations(timeout: 5, handler: nil)
        XCTAssertGreaterThan(movieData?.totalResults ?? 0, 0, "Results is greater than 0")
        XCTAssertNil(error, "Error is nil")
    }
    
    //TODO: Write test to test paging functionality
    func testMovieSearchPagation() {
        
    }
    
    //TODO: Write test for decoding JSON functionality
    func testMovieModelDecoding() {
        
    }
}
