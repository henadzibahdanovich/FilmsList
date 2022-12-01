//
//  FilmListViewModel.swift
//  IMDB-Pet
//
//  Created by Henadzi on 29/11/2022.
//

import UIKit
import RxSwift

final class FilmListViewModel {
    private weak var coordinator: AppCoordinator?
    private var disposeBag = DisposeBag()

    var mediaItems = PublishSubject<[MediaInfo]>()
    
    init(coordinator: AppCoordinator) {
        self.coordinator = coordinator
    }
    
    func getMediaList() {
        let networkService = NetworkService()
        networkService.mokRequestPopularMedia()
            .subscribe { [weak self] mediaInfo in
                self?.mediaItems.onNext(mediaInfo)
                self?.mediaItems.onCompleted()
            }
            .disposed(by: disposeBag)
    }
    
    func mediaTapped(_ mediaInfo: MediaInfo) {
        coordinator?.showInner(with: mediaInfo)
    }
}
