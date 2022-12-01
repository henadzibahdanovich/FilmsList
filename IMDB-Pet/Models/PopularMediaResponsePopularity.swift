//
//  PopularMediaResponsePopularity.swift
//  IMDB-Pet
//
//  Created by Henadzi on 29/11/2022.
//

import Foundation

struct PopularMediaResponsePopularity: Codable {
    let popularity: [MediaInfo]
    let opening: [MediaInfo]
}
