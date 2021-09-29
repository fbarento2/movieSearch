//
//  MovieResource.swift
//  MovieBrowser
//
//  Created by Ferhan Barento on 9/29/21.
//  Copyright © 2021 Lowe's Home Improvement. All rights reserved.
//

import Foundation

protocol DecodableWithURL {
    associatedtype ModelType: Decodable
    var url: URL { get }
}

struct MovieResource: DecodableWithURL {
    
    typealias ModelType = MovieModel
    
    var url: URL = URL(string: Network.movieUrlStr)!
    
    init(query: String) {
        url = URL(string: Network.movieUrlStr + query)!
    }
    
}
