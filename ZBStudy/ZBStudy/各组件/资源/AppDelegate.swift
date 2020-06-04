//
//  AppDelegate.swift
//  ZBStudy
//
//  Created by 赵兵 on 2020/5/26.
//  Copyright © 2020 赵兵. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {


    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
       
        self.window?.rootViewController=ViewController()
        self.window?.makeKeyAndVisible()
        // Override point for customization after application launch.
        return true
    }

    


}

