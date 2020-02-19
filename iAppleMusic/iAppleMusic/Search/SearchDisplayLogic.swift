//
//  SearchDisplayLogic.swift
//  iAppleMusic
//
//  Created by Mykhailo Bondarenko on 19.02.2020.
//  Copyright © 2020 Mykhailo Bondarenko. All rights reserved.
//

import Foundation

protocol SearchDisplayLogic: class {
    func displayData(viewModel: Search.Model.ViewModel.ViewModelData)
}
