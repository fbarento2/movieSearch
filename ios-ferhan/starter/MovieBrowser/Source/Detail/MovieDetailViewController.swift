//
//  MovieDetailViewController.swift
//  SampleApp
//
//  Created by Ferhan Barento, Mark on 2/26/21.
//  Copyright © 2021 Lowe's Home Improvement. All rights reserved.
//

import UIKit

class MovieDetailViewController: UIViewController {
    
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var releaseDateLabel: UILabel!
    @IBOutlet weak var posterImaga: UIImageView!
    @IBOutlet weak var detailLabel: UILabel!
    
    var currentTask: URLSessionDataTask?
    var movie: Movies?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
    }
    
    func configure(){
        if let movie = movie {
            titleLabel.text = movie.title
            releaseDateLabel.text = formatReleaseDate(string: movie.releaseDate)
            detailLabel.text = movie.movieDetail
            let urlImage = movie.poster
            setImage(urlImage: urlImage)
        }
    }
    
    func formatReleaseDate(string: String) -> String {
        if let date = dateFormatterInput.date(from: string) {
            return dateFormatterDisplay.string(from: date)
        } else {
            return "No date "
        }
    }
    
    func setImage(urlImage: String?) {
        if let urlImage = urlImage,
           let url = URL(string: "https://image.tmdb.org/t/p/w500/" + urlImage) {
            let imageRequest = ImageRequest(url: url)
            imageRequest.loadAndDecode { image in
                DispatchQueue.main.async {
                    self.posterImaga?.image = image
                }
            }
        }
    }
}
