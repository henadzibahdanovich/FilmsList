//
//  MediaUserRating.swift
//  IMDB-Pet
//
//  Created by Henadzi on 29/11/2022.
//

import Foundation

struct MediaUserRating: Codable {
    var dtlLikedScore: Int?
    var dtlWtsScore: Int?
    var iconImage: MediaRatingImage?
}
