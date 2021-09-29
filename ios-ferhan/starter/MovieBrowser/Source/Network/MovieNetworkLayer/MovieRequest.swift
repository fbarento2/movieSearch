//
//  MovieRequest.swift
//  MovieBrowser
//
//  Created by Ferhan Barento on 9/29/21.
//  Copyright © 2021 Lowe's Home Improvement. All rights reserved.
//

import Foundation


struct MovieRequest {
    
    func getMovies(query: String, completion: @escaping (Result<MovieModel, MovieRequestError>) -> Void) {
        
        let movieResource = MovieResource(query: query)
        let modelRequest = ModelRequest(resource: movieResource)
        
        modelRequest.loadAndDecode { movieResponse in
            guard let movieResponse = movieResponse else {
                completion(.failure(.noDataAvailable))
                return
            }
            completion(.success(movieResponse))
        }
        
    }
    
    enum MovieRequestError: Error {
        case noDataAvailable
        case cannotDecodeData
    }
}
