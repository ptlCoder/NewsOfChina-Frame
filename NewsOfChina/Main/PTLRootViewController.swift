//
//  PTLRootViewController.swift
//  NewsOfChina
//
//  Created by soliloquy on 2018/6/23.
//  Copyright © 2018年 soliloquy. All rights reserved.
//

import UIKit


class PTLRootViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        addChildViewController(PTLHomePageController(nibName: "PTLHomePageController", bundle: nil), title: "首页", imageName: "")
        addChildViewController(PTLMeViewController(nibName: "PTLMeViewController", bundle: nil), title: "我的", imageName: "")
        
        tabBar.tintColor = UIColor.red
    }
    
    
    fileprivate func addChildViewController(_ vc: UIViewController, title: String, imageName: String) {
        
        vc.tabBarItem.image = UIImage(named: imageName)
        vc.tabBarItem.selectedImage = UIImage(named: imageName + "selected")
        vc.title = title
        let nav = PTLNavigationController(rootViewController: vc)
        
        addChildViewController(nav)
    }
}
