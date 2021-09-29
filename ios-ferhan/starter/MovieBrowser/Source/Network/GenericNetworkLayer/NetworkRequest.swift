//
//  NetworkRequest.swift
//  MovieBrowser
//
//  Created by Ferhan Barento on 9/29/21.
//  Copyright © 2021 Lowe's Home Improvement. All rights reserved.
//

import Foundation

protocol NetworkRequest {
    associatedtype ModelType
    func decode(data: Data) -> ModelType?
    func loadAndDecode(with completion: @escaping (ModelType?) -> Void)
}

extension NetworkRequest {
    func load(url: URL, completion: @escaping (ModelType?) -> Void) {
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard let data = data, error == nil else {
                return completion(nil)
            }
            completion(self.decode(data:data))
        }.resume()
    }
}
