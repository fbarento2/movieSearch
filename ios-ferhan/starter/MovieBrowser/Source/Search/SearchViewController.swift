//
//  SearchViewController.swift
//  SampleApp
//
//  Created by Ferhan Barento, Mark on 2/27/21.
//  Copyright © 2021 Lowe's Home Improvement. All rights reserved.
//

import UIKit

class SearchViewController: UIViewController, UITextFieldDelegate, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet var table: UITableView!
    @IBAction func goButtonPressed(_ sender: Any) {
        if let text = searchBar.text {
            searchMovies(searchText: text)
        }
    }
    @IBOutlet weak var searchBar: UISearchBar!
    
    var movies: [Movies] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        table.delegate = self
        table.dataSource = self
        let nib = UINib(nibName: "MovieCell", bundle: nil)
        table.register(nib, forCellReuseIdentifier: "MovieCell")
    }
    
    func searchMovies(searchText: String) {
        let movieRequest = MovieRequest()
        movieRequest.getMovies(query: searchText) { result in
            switch result {
            case let .success(movies):
                self.movies = movies.results
                print(movies)
                DispatchQueue.main.async {
                    self.table.reloadData()
                }
            case let .failure(movieError):
                print(movieError)
            }
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movies.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "MovieCell") as? MovieCell else { fatalError() }
        cell.movie = movies[indexPath.row]
        cell.updateLabels()
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let vc = storyboard?.instantiateViewController(identifier: "MovieDetailViewController") as? MovieDetailViewController {
            vc.movie = movies[indexPath.row]
            navigationController?.pushViewController(vc, animated: true)
        }
    }
    
}
