//
//  CustomTabbarViewController.swift
//  UITransition
//
//  Created by tskim on 18/08/2019.
//  Copyright © 2019 hucet. All rights reserved.
//

import UIKit

class CustomTabbarViewController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let first = CustomViewController.initFromStoryboard(name: "Main")
        first.view.backgroundColor = UIColor.yellow
        first.tabBarItem.title = "first"
        
        let second = CustomViewController.initFromStoryboard(name: "Main")
        second.view.backgroundColor = UIColor.white
        second.tabBarItem.title = "second"
        
        viewControllers = [
            first,
            second
        ]
        self.delegate = self
    }
}

extension CustomTabbarViewController: UITabBarControllerDelegate {
    func tabBarController(_ tabBarController: UITabBarController, animationControllerForTransitionFrom fromVC: UIViewController, to toVC: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return CustomPresentSlideAnimatedTransitioning()
    }
}
