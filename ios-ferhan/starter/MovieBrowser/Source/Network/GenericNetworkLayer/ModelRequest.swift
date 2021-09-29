//
//  ModelRequest.swift
//  MovieBrowser
//
//  Created by Ferhan Barento on 9/29/21.
//  Copyright © 2021 Lowe's Home Improvement. All rights reserved.
//

import Foundation

class ModelRequest<Resource: DecodableWithURL> {
    var resource: Resource
    
    init(resource: Resource) {
        self.resource = resource
    }
}

extension ModelRequest: NetworkRequest {
    func decode(data: Data) -> Resource.ModelType? {
        return try? JSONDecoder().decode(Resource.ModelType.self, from: data)
    }
    
    func loadAndDecode(with completion: @escaping (Resource.ModelType?) -> Void) {
        load(url: resource.url, completion: completion)
    }
}

