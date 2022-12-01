//
//  AppCoordinator.swift
//  IMDB-Pet
//
//  Created by Henadzi on 29/11/2022.
//

import UIKit

final class AppCoordinator: UINavigationController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationBar.prefersLargeTitles = true
        navigationBar.overrideUserInterfaceStyle = .dark
        navigationBar.tintColor = .white
    }
    
    func start() {
        showFilmsList()
    }
    
    func showFilmsList() {
        let filmsVM = FilmListViewModel(coordinator: self)
        let filmsVC = FilmListViewController(viewModel: filmsVM)
        viewControllers.insert(filmsVC, at: 0)
    }
    
    func showInner(with info: MediaInfo) {
        let innerVM = MediaInnerViewModel(coordinator: self, mediaInfo: info)
        let innerVC = MediaInnerViewController(viewModel: innerVM)
        show(innerVC, sender: nil)
    }
}
