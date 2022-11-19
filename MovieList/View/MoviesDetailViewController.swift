//
//  MoviesDetailViewController.swift
//  MovieList
//
//  Created by Carlos Eduardo Teixeira Silva on 15/11/22.
//

import UIKit
import Kingfisher

class MovieDetailsViewController: UIViewController {
    private var movie: Movie
    
    private lazy var titleView: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = movie.title
        label.textAlignment = .center
        label.numberOfLines = 0
        
        label.textColor = .white
        label.font = .systemFont(ofSize: 24.0, weight: .bold)
        return label
    }()
    
    private lazy var useScoreLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Classificação dos usuarios: \(movie.voteAverage)"
        label.numberOfLines = 0
        label.textColor = .white
        label.font = .systemFont(ofSize: 16, weight: .bold)
        return label
    }()
    
    private lazy var descriptionScoreLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Classificação dos usuarios: \(movie.voteAverage)"
        label.numberOfLines = 0
        label.textColor = .white.withAlphaComponent(0.75)
        label.attributedText = NSAttributedString(string: movie.overview).withLineSpacing(8)
        return label
    }()
    
    private lazy var imagePoster: UIImageView = {
        let imgView = UIImageView()
        imgView.translatesAutoresizingMaskIntoConstraints = false
        imgView.layer.cornerRadius = 32
        imgView.layer.masksToBounds = true
        return imgView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.setBackground()
        setLayout()
    }
    
    init(movie: Movie) {
        self.movie = movie
        super.init(nibName: nil, bundle: nil)
        guard let imageUrl = movie.image else { return }
        imagePoster.configureImage(imageUrl)
    }
    
    required init?(coder: NSCoder) {
        fatalError("not init coder")
    }
    
    private func setLayout() {
        view.addSubview(titleView)
        view.addSubview(imagePoster)
        view.addSubview(useScoreLabel)
        view.addSubview(descriptionScoreLabel)
        
        let guide = self.view.safeAreaLayoutGuide
        
        NSLayoutConstraint.activate([
            titleView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 32),
            titleView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            titleView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            
            useScoreLabel.topAnchor.constraint(equalTo: imagePoster.bottomAnchor, constant: 32),
            useScoreLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            imagePoster.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            imagePoster.widthAnchor.constraint(equalToConstant: 192),
            imagePoster.heightAnchor.constraint(equalToConstant: 264.0),
            imagePoster.topAnchor.constraint(equalTo: titleView.bottomAnchor,constant: 32),
        
            descriptionScoreLabel.trailingAnchor.constraint(equalTo: guide.trailingAnchor, constant: -16),
            descriptionScoreLabel.leadingAnchor.constraint(equalTo: guide.leadingAnchor, constant: 16),
            descriptionScoreLabel.topAnchor.constraint(equalTo: useScoreLabel.bottomAnchor, constant: 32),
        ])
    }
}
