//
//  MovieModel.swift
//  MovieBrowser
//
//  Created by Ferhan Barento on 9/27/21.
//  Copyright © 2021 Lowe's Home Improvement. All rights reserved.
//

import Foundation
struct MovieModel: Decodable {
    let results: [Movies]
}

struct Movies: Decodable {
    let title: String
    let releaseDate: String
    let rating: Double
    let poster: String
    let movieDetail: String
    enum CodingKeys: String, CodingKey {
        case title = "original_title"
        case releaseDate = "release_date"
        case rating = "vote_average"
        case poster = "poster_path"
        case movieDetail = "overview"
    }
}
