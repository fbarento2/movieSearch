//
//  MovieCell.swift
//  MovieBrowser
//
//  Created by Ferhan Barento on 9/27/21.
//  Copyright © 2021 Lowe's Home Improvement. All rights reserved.
//

import UIKit

class MovieCell: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var releaseDateLabel: UILabel!
    @IBOutlet weak var ratingLabel: UILabel!
    
    var movie: Movies?
    
    func updateLabels() {
        titleLabel.text = movie?.title
        releaseDateLabel.text =  movie?.releaseDate
        ratingLabel.text = "\(movie?.rating ?? 0)"
    }
    
}
