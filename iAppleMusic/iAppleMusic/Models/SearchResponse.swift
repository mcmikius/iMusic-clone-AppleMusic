//
//  SearchResponse.swift
//  iAppleMusic
//
//  Created by Mykhailo Bondarenko on 18.02.2020.
//  Copyright © 2020 Mykhailo Bondarenko. All rights reserved.
//

import Foundation

struct SearchResponse: Decodable {
    var resultCount: Int
    var results: [Track]
}
