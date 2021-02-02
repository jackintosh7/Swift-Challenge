//
//  MovieModel.swift
//  Wipfli Challenge
//
//  Created by Jack Higgins on 1/27/21.
//

import Foundation
import RealmSwift

final class MovieModel: Object, Decodable {
    
    override class func primaryKey() -> String? { "id" }
    
    @objc dynamic var id: String = ""
    
    @objc dynamic var title: String = ""
    @objc dynamic var year: String = ""
    @objc dynamic var rated: String?
    @objc dynamic var released: String?
    @objc dynamic var genre: String?
    @objc dynamic var director: String?
    @objc dynamic var writer: String?
    @objc dynamic var actors: String?
    @objc dynamic var plot: String?
    @objc dynamic var language: String?
    @objc dynamic var country: String?
    @objc dynamic var awards: String?
    @objc dynamic var poster: String?

    var ratings: [RatingModel]?

    @objc dynamic var metaScore: String?
    @objc dynamic var imdbRating: String?
    @objc dynamic var imdbVotes: String?
    @objc dynamic var imdbID: String?
    @objc dynamic var type: String?
    @objc dynamic var totalSeasons: String?
    @objc dynamic var response: String?
    
    override init() {
        super.init()
    }
    
    init(from decoder: Decoder) throws {
        super.init()
        
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        id = try container.decode(.imdbID)
        title = try container.decode(.title)
        year = try container.decode(.year)
        rated = try? container.decodeIfPresent(.rated)
        released = try? container.decodeIfPresent(.released)
        genre = try? container.decodeIfPresent(.genre)
        director = try? container.decodeIfPresent(.director)
        writer = try? container.decodeIfPresent(.writer)
        actors = try? container.decodeIfPresent(.actors)
        plot = try? container.decodeIfPresent(.plot)
        language = try? container.decodeIfPresent(.language)
        country = try? container.decodeIfPresent(.country)
        awards = try? container.decodeIfPresent(.awards)
        poster = try? container.decodeIfPresent(.poster)
        ratings = try? container.decodeIfPresent(.ratings)
        metaScore = try? container.decodeIfPresent(.metaScore)
        imdbRating = try? container.decodeIfPresent(.imdbRating)
        imdbVotes = try? container.decodeIfPresent(.imdbVotes)
        imdbID = try container.decode(.imdbID)
        type = try? container.decodeIfPresent(.type)
        totalSeasons = try? container.decodeIfPresent(.totalSeasons)
        response = try? container.decodeIfPresent(.response)
    }
}

extension MovieModel {
    
    enum CodingKeys: String, CodingKey {
        
        case title = "Title"
        case year = "Year"
        case rated = "Rated"
        case released = "Released"
        case runtime = "Runtime"
        case genre = "Genre"
        case director = "Director"
        case writer = "Writer"
        case actors = "Actors"
        case plot = "Plot"
        case language = "Language"
        case country = "Country"
        case awards = "Awards"
        case poster = "Poster"
        case ratings = "Ratings"
        case metaScore = "Metascore"
        case imdbRating = "imdbRating"
        case imdbVotes = "imdbVotes"
        case imdbID = "imdbID"
        case type = "Type"
        case totalSeasons = "totalSeasons"
        case response = "Response"
    }
}

extension MovieModel {
    // TODO: Loop through ratings array, calculate and return average
    public func calculateMovieAverage(ratings: [RatingModel]) -> Double {
        return 3
    }
}
