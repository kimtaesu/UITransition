//
//  HeroTabbarViewController.swift
//  UITransition
//
//  Created by tskim on 18/08/2019.
//  Copyright © 2019 hucet. All rights reserved.
//

import UIKit

class HeroTabbarViewController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let first = HeroExampleViewController.initFromStoryboard(name: "Main")
        first.view.backgroundColor = UIColor.yellow
        first.tabBarItem.title = "first"
        
        let second = HeroExampleViewController.initFromStoryboard(name: "Main")
        second.view.backgroundColor = UIColor.white
        second.tabBarItem.title = "second"
        
        viewControllers = [
            first,
            second
        ]
    }
}
