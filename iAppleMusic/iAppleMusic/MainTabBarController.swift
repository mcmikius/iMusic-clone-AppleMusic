//
//  MainTabBarController.swift
//  iAppleMusic
//
//  Created by Mykhailo Bondarenko on 18.02.2020.
//  Copyright © 2020 Mykhailo Bondarenko. All rights reserved.
//

import UIKit

class MainTabBarController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemBackground
        tabBar.tintColor = .systemPink
        setupTrackDetailView()
        
        let searchViewController: SearchViewController = SearchViewController.loadFromStoryboard()
        
        viewControllers = [generateViewController(rootViewController: searchViewController, image: UIImage(named: "search")!, title: "Search"), generateViewController(rootViewController: ViewController(), image: UIImage(named: "library")!, title: "Library")]
    }
    
    private func generateViewController(rootViewController: UIViewController, image: UIImage, title: String) -> UIViewController {
        let navigationViewController = UINavigationController(rootViewController: rootViewController)
        navigationViewController.tabBarItem.image = image
        navigationViewController.tabBarItem.title = title
        rootViewController.navigationItem.title = title
        navigationViewController.navigationBar.prefersLargeTitles = true
        return navigationViewController
    }
    
    private func setupTrackDetailView() {
        let trackDetailView: TrackDetailView = TrackDetailView.loadFromNib()
        view.insertSubview(trackDetailView, belowSubview: tabBar)
    }
}
