//
//  MoviesDetailViewController.swift
//  MovieList
//
//  Created by Carlos Eduardo Teixeira Silva on 15/11/22.
//

import UIKit

class MovieDetailsViewController: UIViewController {
    private var movie: Movie
    
    private lazy var titleView: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = movie.title
        label.textAlignment = .center
        label.numberOfLines = 2
        
        label.textColor = .white
        label.font = .systemFont(ofSize: 24.0, weight: .bold)
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.setBackground()
        setLayout()
    }
    
    init(movie: Movie) {
        self.movie = movie
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("not init coder")
    }
    
    private func setLayout() {
        view.addSubview(titleView)
        navigationController?.navigationBar.tintColor = UIColor.white
        
        NSLayoutConstraint.activate([
            titleView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            titleView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            titleView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.7)
         
        ])
    }
}
