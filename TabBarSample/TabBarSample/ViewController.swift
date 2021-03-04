//
//  ViewController.swift
//  TabBarSample
//
//  Created by John Chou on 2021/2/23.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let myTabBar = EZTabBarViewController()
        self.addChild(myTabBar)
        self.view.addSubview(myTabBar.view)
        myTabBar.view.willMove(toSuperview: self.view)
    }
}

