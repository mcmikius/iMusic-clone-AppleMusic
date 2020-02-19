//
//  MainTabBarController.swift
//  iAppleMusic
//
//  Created by Mykhailo Bondarenko on 18.02.2020.
//  Copyright © 2020 Mykhailo Bondarenko. All rights reserved.
//

import UIKit

protocol MainTabBarControllerDelegate: class {
    func minimizedTrackDetailController()
}

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
    
    private var minimizedTopAnchorContraint: NSLayoutConstraint!
    private var maximizedTopAnchorContraint: NSLayoutConstraint!
    
    private func setupTrackDetailView() {
        let trackDetailView: TrackDetailView = TrackDetailView.loadFromNib()
        trackDetailView.tabBarDelegate = self
        view.insertSubview(trackDetailView, belowSubview: tabBar)
        
        trackDetailView.translatesAutoresizingMaskIntoConstraints = false
        
        maximizedTopAnchorContraint = trackDetailView.topAnchor.constraint(equalTo: view.topAnchor)
        minimizedTopAnchorContraint = trackDetailView.topAnchor.constraint(equalTo: tabBar.topAnchor, constant: -64)
        
        maximizedTopAnchorContraint.isActive = true
        
        trackDetailView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        trackDetailView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        trackDetailView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        
        
    }
}

extension MainTabBarController: MainTabBarControllerDelegate {
    
    
    func minimizedTrackDetailController() {
        maximizedTopAnchorContraint.isActive = false
        minimizedTopAnchorContraint.isActive = true
        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.7, initialSpringVelocity: 1, options: .curveEaseInOut, animations: {
            self.view.layoutIfNeeded()
        }, completion: nil)
    }
    
    
}
