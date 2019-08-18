//
//  HeroExampleViewController.swift
//  UITransition
//
//  Created by tskim on 18/08/2019.
//  Copyright © 2019 hucet. All rights reserved.
//

// https://github.com/HeroTransitions/Hero/wiki/Default-Animations
import UIKit
import Hero
class HeroExampleViewController: UIViewController, StoryboardInitializable {

    @IBOutlet weak var pickerView: UIPickerView!
    private var selectedRow: Int?
    private var pickerItem: [Int: (String, HeroDefaultAnimationType)] = [
        0: ("zoom", .zoom),
        1: ("zoomOut", .zoomOut),
        2: ("page down", .pageIn(direction: .down)),
        3: ("pull down", .pull(direction: .down)),
        4: ("slide down", .slide(direction: .down))
    ]

    private let colors = [UIColor.red, UIColor.cyan, UIColor.orange, UIColor.green, UIColor.magenta, UIColor.yellow, UIColor.brown, UIColor.darkGray]

    override func viewDidLoad() {
        super.viewDidLoad()
        pickerView.dataSource = self
        pickerView.delegate = self
    }
    @IBAction func close(_ sender: Any) {
        self.hero.unwindToRootViewController()
    }
    @IBAction func presentTap(_ sender: Any) {
        let toView = HeroExampleViewController.initFromStoryboard(name: "Main")
        toView.hero.isEnabled = true
        toView.hero.modalAnimationType = pickerItem[self.selectedRow ?? 0]?.1 ?? HeroDefaultAnimationType.fade
        toView.view.backgroundColor = colors.randomElement()
        self.present(toView, animated: true)
    }
    @IBAction func pushTap(_ sender: Any) {
        let toView = HeroExampleViewController.initFromStoryboard(name: "Main")
        toView.hero.isEnabled = true
        toView.view.backgroundColor = colors.randomElement()
        self.navigationController?.hero.isEnabled = true
        self.navigationController?.hero.navigationAnimationType = pickerItem[self.selectedRow ?? 0]?.1 ?? .fade
        self.navigationController?.pushViewController(toView, animated: true)
    }

    var currentSelectedIndex = true
    @IBAction func tabbarTap(_ sender: Any) {
        let toView = HeroExampleViewController.initFromStoryboard(name: "Main")
        toView.hero.isEnabled = true
        toView.view.backgroundColor = colors.randomElement()
        self.tabBarController?.hero.isEnabled = true
        self.tabBarController?.hero.tabBarAnimationType = pickerItem[self.selectedRow ?? 0]?.1 ?? .fade
        self.tabBarController?.selectedIndex = currentSelectedIndex ? 1 : 0
        currentSelectedIndex = !currentSelectedIndex
    }
}


extension HeroExampleViewController: UIPickerViewDataSource, UIPickerViewDelegate {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }

    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickerItem.count
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return pickerItem[row]?.0
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        self.selectedRow = row
    }
}
