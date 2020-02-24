//
//  SearchModels.swift
//  iAppleMusic
//
//  Created by Mykhailo Bondarenko on 18.02.2020.
//  Copyright (c) 2020 Mykhailo Bondarenko. All rights reserved.
//

import UIKit
import SwiftUI

enum Search {
   
  enum Model {
    struct Request {
      enum RequestType {
        case getTracks(searchTerm: String)
      }
    }
    struct Response {
      enum ResponseType {
        case presentTracks(searchResponse: SearchResponse?)
        case presentFooterView
      }
    }
    struct ViewModel {
      enum ViewModelData {
        case displayTracks(searchViewModel: SearchViewModel)
        case displayFooterView
      }
    }
  }
}


class SearchViewModel: NSObject, NSCoding {
    
    let cells: [Cell]
    
    func encode(with coder: NSCoder) {
        coder.encode(cells, forKey: "cells")
    }
    
    required init?(coder: NSCoder) {
        cells = coder.decodeObject(forKey: "cells") as? [SearchViewModel.Cell] ?? []
    }
    
    @objc(_TtCC11iAppleMusic15SearchViewModel4Cell)class Cell: NSObject, NSCoding, Identifiable {
        
        var id = UUID()
        var iconUrlString: String?
        var trackName: String
        var artistName: String
        var collectionName: String?
        var previewUrl: String?
        
        func encode(with coder: NSCoder) {
            coder.encode(iconUrlString, forKey: "iconUrlString")
            coder.encode(trackName, forKey: "trackName")
            coder.encode(artistName, forKey: "artistName")
            coder.encode(collectionName, forKey: "collectionName")
            coder.encode(previewUrl, forKey: "previewUrl")
        }
        
        required init?(coder: NSCoder) {
            iconUrlString = coder.decodeObject(forKey: "iconUrlString") as? String? ?? ""
            trackName = coder.decodeObject(forKey: "trackName") as? String ?? ""
            artistName = coder.decodeObject(forKey: "artistName") as? String ?? ""
            collectionName = coder.decodeObject(forKey: "collectionName") as? String? ?? ""
            previewUrl = coder.decodeObject(forKey: "previewUrl") as? String? ?? ""
        }
        
        init(iconUrlString: String?, trackName: String, artistName: String, collectionName: String?, previewUrl: String?) {
            self.iconUrlString = iconUrlString
            self.trackName = trackName
            self.artistName = artistName
            self.collectionName = collectionName
            self.previewUrl = previewUrl
        }
    }
    init(cells: [Cell]) {
        self.cells = cells
    }
    
}
