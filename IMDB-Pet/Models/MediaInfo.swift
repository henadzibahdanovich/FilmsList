//
//  MediaInfo.swift
//  IMDB-Pet
//
//  Created by Henadzi on 29/11/2022.
//

import Foundation

struct MediaInfo: Codable {
    var emsId: String?
    var emsVersionId: String?
    var name: String?
    var sortEms: Int?
    var sortPopularity: Int?
    var posterImage: MediaInfoPosterImage?
    var tomatoRating: MediaTomatoRating?
    var userRating: MediaUserRating?
}
