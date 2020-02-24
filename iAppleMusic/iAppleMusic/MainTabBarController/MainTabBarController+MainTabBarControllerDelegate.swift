//
//  MainTabBarController+MainTabBarControllerDelegate.swift
//  iAppleMusic
//
//  Created by Mykhailo Bondarenko on 19.02.2020.
//  Copyright © 2020 Mykhailo Bondarenko. All rights reserved.
//

import Foundation
import UIKit

extension MainTabBarController: MainTabBarControllerDelegate {
    
    func maximizedTrackDetailController(viewModel: SearchViewModel.Cell?) {
        minimizedTopAnchorContraint.isActive = false
        maximizedTopAnchorContraint.isActive = true
        maximizedTopAnchorContraint.constant = 0
        bottomAnchorContraint.constant = 0
        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.7, initialSpringVelocity: 1, options: .curveEaseInOut, animations: {
            self.view.layoutIfNeeded()
            self.tabBar.alpha = 0
            self.trackDetailView.miniTrackView.alpha = 0
            self.trackDetailView.maximizedStackView.alpha = 1
        }, completion: nil)
        guard let viewModel = viewModel else {
            return
        }
        self.trackDetailView.set(viewModel: viewModel)
    }
    
    func minimizedTrackDetailController() {
        maximizedTopAnchorContraint.isActive = false
        bottomAnchorContraint.constant = view.frame.height
        minimizedTopAnchorContraint.isActive = true
        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.7, initialSpringVelocity: 1, options: .curveEaseInOut, animations: {
            self.view.layoutIfNeeded()
            self.tabBar.alpha = 1
            self.trackDetailView.miniTrackView.alpha = 1
            self.trackDetailView.maximizedStackView.alpha = 0
        }, completion: nil)
    }
    
    
}
