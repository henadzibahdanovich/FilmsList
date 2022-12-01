//
//  MediaInnerViewController.swift
//  IMDB-Pet
//
//  Created by Henadzi on 30/11/2022.
//

import UIKit

class MediaInnerViewController: UIViewController {
    let viewModel: MediaInnerViewModel
    
    private lazy var scrollView: UIScrollView = {
        let scroll = UIScrollView()
        scroll.showsVerticalScrollIndicator = false
        scroll.alwaysBounceVertical = true
        return scroll
    }()
    
    private lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleToFill
        imageView.layer.cornerRadius = 8
        imageView.layer.borderColor = UIColor.white.cgColor
        imageView.layer.borderWidth = 1
        imageView.clipsToBounds = true
        return imageView
    }()
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 26, weight: .bold)
        label.textColor = .white
        label.numberOfLines = 0
        label.textAlignment = .center
        return label
    }()
    
    private lazy var tomatoeImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleToFill
        return imageView
    }()
    
    private lazy var tomatoeTitleLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 16, weight: .medium)
        label.textColor = .white
        return label
    }()
    
    private lazy var tomatoeValueLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 16, weight: .regular)
        label.textColor = .white
        return label
    }()
    
    private lazy var userImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleToFill
        return imageView
    }()
    
    private lazy var userTitleLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 16, weight: .medium)
        label.textColor = .white
        return label
    }()
    
    private lazy var userValueLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 16, weight: .regular)
        label.textColor = .white
        return label
    }()
    
    init(viewModel: MediaInnerViewModel) {
        self.viewModel = viewModel
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        super.loadView()
        
        view.backgroundColor = UIColor(hexString: "65C2FF")
        
        view.addSubview(scrollView)
        
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
        
        scrollView.addSubview(imageView)
        scrollView.addSubview(titleLabel)
        
        scrollView.addSubview(tomatoeImageView)
        scrollView.addSubview(tomatoeTitleLabel)
        scrollView.addSubview(tomatoeValueLabel)
        
        scrollView.addSubview(userImageView)
        scrollView.addSubview(userTitleLabel)
        scrollView.addSubview(userValueLabel)

        imageView.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        
        tomatoeImageView.translatesAutoresizingMaskIntoConstraints = false
        tomatoeTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        tomatoeValueLabel.translatesAutoresizingMaskIntoConstraints = false
        
        userImageView.translatesAutoresizingMaskIntoConstraints = false
        userTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        userValueLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: view.safeAreaInsets.top + 24),
            imageView.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor),
            imageView.widthAnchor.constraint(equalToConstant: 180),
            imageView.heightAnchor.constraint(equalToConstant: 240)
        ])
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 18),
            titleLabel.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor),
            titleLabel.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 24),
            titleLabel.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor, constant: -24),
        ])
        
        NSLayoutConstraint.activate([
            tomatoeImageView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 18),
            tomatoeImageView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 24),
            tomatoeImageView.heightAnchor.constraint(equalToConstant: 24),
            tomatoeImageView.widthAnchor.constraint(equalToConstant: 24)
        ])
        
        NSLayoutConstraint.activate([
            tomatoeTitleLabel.centerYAnchor.constraint(equalTo: tomatoeImageView.centerYAnchor),
            tomatoeTitleLabel.leadingAnchor.constraint(equalTo: tomatoeImageView.trailingAnchor, constant: 12)
        ])
        
        NSLayoutConstraint.activate([
            tomatoeValueLabel.centerYAnchor.constraint(equalTo: tomatoeImageView.centerYAnchor),
            tomatoeValueLabel.leadingAnchor.constraint(equalTo: tomatoeTitleLabel.trailingAnchor, constant: 4)
        ])
        
        NSLayoutConstraint.activate([
            userImageView.topAnchor.constraint(equalTo: tomatoeImageView.bottomAnchor, constant: 14),
            userImageView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 24),
            userImageView.heightAnchor.constraint(equalToConstant: 24),
            userImageView.widthAnchor.constraint(equalToConstant: 24)
        ])
        
        NSLayoutConstraint.activate([
            userTitleLabel.centerYAnchor.constraint(equalTo: userImageView.centerYAnchor),
            userTitleLabel.leadingAnchor.constraint(equalTo: userImageView.trailingAnchor, constant: 12)
        ])
        
        NSLayoutConstraint.activate([
            userValueLabel.centerYAnchor.constraint(equalTo: userImageView.centerYAnchor),
            userValueLabel.leadingAnchor.constraint(equalTo: userTitleLabel.trailingAnchor, constant: 4)
        ])
        
        imageView.load(from: viewModel.mediaInfo.posterImage?.url)
        titleLabel.text = viewModel.mediaInfo.name
        
        tomatoeImageView.load(from: viewModel.mediaInfo.tomatoRating?.iconImage?.url)
        tomatoeTitleLabel.text = "Tomatoe rating: "
        tomatoeValueLabel.text = String(viewModel.mediaInfo.tomatoRating?.tomatometer ?? 0) + "%"
        
        userImageView.load(from: viewModel.mediaInfo.userRating?.iconImage?.url)
        userTitleLabel.text = "User rating: "
        userValueLabel.text = String(viewModel.mediaInfo.userRating?.dtlLikedScore ?? 0)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        navigationItem.largeTitleDisplayMode = .never
    }
}
