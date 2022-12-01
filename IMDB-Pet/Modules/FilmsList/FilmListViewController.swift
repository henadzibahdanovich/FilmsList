//
//  FilmListViewController.swift
//  IMDB-Pet
//
//  Created by Henadzi on 29/11/2022.
//

import UIKit
import RxSwift
import RxCocoa

class FilmListViewController: UIViewController {
    private let viewModel: FilmListViewModel
    private var disposeBag = DisposeBag()
    
    private lazy var layout: UICollectionViewLayout = {
        let layout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 12, left: 0, bottom: 12, right: 0)
        layout.itemSize = CGSize(width: UIScreen.main.bounds.width, height: 88)
        layout.scrollDirection = .vertical
        layout.minimumLineSpacing = 16
        return layout
    }()
    
    private lazy var collectionView: UICollectionView = {
        let collectionView = UICollectionView(frame: view.bounds, collectionViewLayout: layout)
        collectionView.register(MediaPreviewCollectionViewCell.self, forCellWithReuseIdentifier: "MediaPreviewTableViewCell")
        return collectionView
    }()
    
    init(viewModel: FilmListViewModel) {
        self.viewModel = viewModel
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        super.loadView()
        
        title = "Media list"
        
        view.addSubview(collectionView)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.backgroundColor = UIColor(hexString: "65C2FF")
        
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: view.topAnchor),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
        
        bindTableData()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.largeTitleDisplayMode = .always
    }

    private func bindTableData() {
        viewModel.mediaItems
            .bind(
                to: collectionView.rx.items(
                    cellIdentifier: "MediaPreviewTableViewCell",
                    cellType: MediaPreviewCollectionViewCell.self
                )
            ) { row, mediaInfo, cell in
                let bgColor = UIColor(
                    red: .random(in: 150...255) / 255,
                    green: .random(in: 150...255) / 255,
                    blue: .random(in: 150...255) / 255,
                    alpha: 1
                )
                
                cell.setup(with: mediaInfo, and: bgColor)
            }
            .disposed(by: disposeBag)
        
        collectionView.rx
            .modelSelected(MediaInfo.self)
            .bind { [weak self] mediaInfo in
                self?.viewModel.mediaTapped(mediaInfo)
            }
            .disposed(by: disposeBag)
        
        viewModel.getMediaList()
    }
}
