//
//  PTLNavigationController.swift
//  DanTangWithPTL
//
//  Created by pengtanglong on 16/8/22.
//  Copyright © 2016年 pengtanglong. All rights reserved.
//

import UIKit

class PTLNavigationController: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // 导航栏背景颜色
        navigationBar.barTintColor = UIColor.red
        
        // 中间标题颜色
        navigationBar.titleTextAttributes = [NSAttributedStringKey.font: UIFont.systemFont(ofSize: 20), NSAttributedStringKey.foregroundColor: UIColor.white]
        
        // 两边按钮的颜色
        navigationBar.tintColor = UIColor.white

    }
}


extension PTLNavigationController {

    override func pushViewController(_ viewController: UIViewController, animated: Bool) {
        if viewControllers.count > 0 {
            
            viewController.hidesBottomBarWhenPushed = true;
            viewController.navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(named: "checkUserType_backward_9x15_"), style: .plain, target: self, action: #selector(backButtonClick))
        }

        super.pushViewController(viewController, animated: true)
    }
    
    @objc func backButtonClick() {

        if UIApplication.shared.isNetworkActivityIndicatorVisible {
            UIApplication.shared.isNetworkActivityIndicatorVisible = false
        }
        popViewController(animated: true)
    }
}
