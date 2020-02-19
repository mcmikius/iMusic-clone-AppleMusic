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
    func maximizedTrackDetailController(viewModel: SearchViewModel.Cell?)
}

class MainTabBarController: UITabBarController {
    
    let searchViewController: SearchViewController = SearchViewController.loadFromStoryboard()
    
    private var minimizedTopAnchorContraint: NSLayoutConstraint!
    private var maximizedTopAnchorContraint: NSLayoutConstraint!
    private var bottomAnchorContraint: NSLayoutConstraint!
    let trackDetailView: TrackDetailView = TrackDetailView.loadFromNib()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemBackground
        tabBar.tintColor = .systemPink
        setupTrackDetailView()
        searchViewController.tabBarDelegate = self
        
        
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
        
        trackDetailView.tabBarDelegate = self
        trackDetailView.delegate = searchViewController
        view.insertSubview(trackDetailView, belowSubview: tabBar)
        
        trackDetailView.translatesAutoresizingMaskIntoConstraints = false
        
        maximizedTopAnchorContraint = trackDetailView.topAnchor.constraint(equalTo: view.topAnchor, constant: view.frame.height)
        minimizedTopAnchorContraint = trackDetailView.topAnchor.constraint(equalTo: tabBar.topAnchor, constant: -64)
        bottomAnchorContraint = trackDetailView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: view.frame.height)
        bottomAnchorContraint.isActive = true
        maximizedTopAnchorContraint.isActive = true
        
        trackDetailView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        trackDetailView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        
        
    }
}

extension MainTabBarController: MainTabBarControllerDelegate {
    
    func maximizedTrackDetailController(viewModel: SearchViewModel.Cell?) {
        maximizedTopAnchorContraint.isActive = true
        minimizedTopAnchorContraint.isActive = false
        maximizedTopAnchorContraint.constant = 0
        bottomAnchorContraint.constant = 0
        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.7, initialSpringVelocity: 1, options: .curveEaseInOut, animations: {
            self.view.layoutIfNeeded()
            self.tabBar.alpha = 0
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
        }, completion: nil)
    }
    
    
}
