//
//  CustomViewController.swift
//  UITransition
//
//  Created by tskim on 18/08/2019.
//  Copyright © 2019 hucet. All rights reserved.
//

import UIKit

class CustomViewController: UIViewController, StoryboardInitializable {

    private let colors = [UIColor.red, UIColor.cyan, UIColor.orange, UIColor.green, UIColor.magenta, UIColor.yellow]

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Custom"
        self.transitioningDelegate = self
    }
    @IBAction func tabTap(_ sender: Any) {
        self.tabBarController!.selectedIndex = self.tabBarController!.selectedIndex == 0 ? 1 : 0
    }
    @IBAction func presentTap(_ sender: Any) {
        let toView = CustomViewController.initFromStoryboard(name: "Main")
        toView.view.backgroundColor = colors.randomElement()
        self.present(toView, animated: true)
    }
    @IBAction func navigationTap(_ sender: Any) {
        let toView = CustomViewController.initFromStoryboard(name: "Main")
        toView.view.backgroundColor = colors.randomElement()
        self.navigationController!.delegate = self
        self.navigationController!.pushViewController(toView, animated: true)
    }
    @IBAction func close(_ sender: Any) {
        self.hero.dismissViewController()
    }
}

extension CustomViewController: UIViewControllerTransitioningDelegate {
    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return CustomPresentSlideAnimatedTransitioning()
    }
}

extension CustomViewController: UINavigationControllerDelegate {
    func navigationController(_ navigationController: UINavigationController, animationControllerFor operation: UINavigationController.Operation, from fromVC: UIViewController, to toVC: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return CustomPresentSlideAnimatedTransitioning()
    }
}
