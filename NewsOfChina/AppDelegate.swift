//
//  AppDelegate.swift
//  NewsOfChina
//
//  Created by soliloquy on 2018/6/23.
//  Copyright © 2018年 soliloquy. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.backgroundColor = UIColor.white
        window?.rootViewController = PTLRootViewController()
        window?.makeKeyAndVisible()
        
        
        return true
    }



}

