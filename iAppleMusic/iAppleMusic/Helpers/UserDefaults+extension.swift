//
//  UserDefaults+extension.swift
//  iAppleMusic
//
//  Created by Mykhailo Bondarenko on 24.02.2020.
//  Copyright © 2020 Mykhailo Bondarenko. All rights reserved.
//

import Foundation

extension UserDefaults {
    static let favouriteTrackKey = "favouriteTrackKey"
    func savedTracks() -> [SearchViewModel.Cell] {
        let userDefaults = UserDefaults.standard
        guard let savedTracks = userDefaults.object(forKey: UserDefaults.favouriteTrackKey) as? Data else {
            return []
        }
        guard let decodedTracks = try? NSKeyedUnarchiver.unarchiveTopLevelObjectWithData(savedTracks) as? [SearchViewModel.Cell] else {
            return []
        }
        return decodedTracks
    }
}
