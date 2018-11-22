//
//  PTLRootViewController.swift
//  NewsOfChina
//
//  Created by soliloquy on 2018/6/23.
//  Copyright © 2018年 soliloquy. All rights reserved.
//

import UIKit


class PTLTabbarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        
        addChildViewController(PTLHomePageController(), title: "首页", imageName: "octicon-pulse", selectedImageName: "octicon-pulse")
        addChildViewController(PTLMeViewController(), title: "我的", imageName: "octicon-person", selectedImageName: "octicon-person")
        tabBar.tintColor = UIColor.red
        
        
        let fps = PTLFPSLabel(frame: CGRect(x: 10, y: kScreenHeight-30, width: 40, height: 20))
        fps.sizeToFit()
        
        self.view.addSubview(fps)
        
        
        
    }
    
    
    fileprivate func addChildViewController(_ vc: UIViewController, title: String, imageName: String, selectedImageName: String) {
        
        vc.tabBarItem.image = PTLImageTools.ptl_Octicons_image(withIdentifier: imageName)
        vc.tabBarItem.selectedImage = PTLImageTools.ptl_Octicons_image(withIdentifier: selectedImageName, color: UIColor.red)
        vc.title = title
        let nav = PTLNavigationController(rootViewController: vc)
        
        addChildViewController(nav)
    }
}
