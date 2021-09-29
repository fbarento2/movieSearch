//
//  ImageRequest.swift
//  MovieBrowser
//
//  Created by Ferhan Barento on 9/29/21.
//  Copyright © 2021 Lowe's Home Improvement. All rights reserved.
//

import UIKit

class ImageRequest {
    let url: URL
    
    init(url: URL) {
        self.url = url
    }
    
}

extension ImageRequest: NetworkRequest {
    func decode(data: Data) -> UIImage? {
        return UIImage(data: data)
    }
    
    func loadAndDecode(with completion: @escaping (UIImage?) -> Void) {
        load(url: url, completion: completion)
    }
}
