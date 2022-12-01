//
//  MediaInnerViewModel.swift
//  IMDB-Pet
//
//  Created by Henadzi on 30/11/2022.
//

import Foundation

class MediaInnerViewModel {
    private weak var coordinator: AppCoordinator?
    var mediaInfo: MediaInfo
    
    init(coordinator: AppCoordinator, mediaInfo: MediaInfo) {
        self.coordinator = coordinator
        self.mediaInfo = mediaInfo
    }
}
