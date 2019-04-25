//
//  AppDelegate.swift
//  PicSumSwiftMVVM
//
//  Created by VitorOtero on 22/04/19.
//  Copyright © 2019 VitorOtero. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        let window = UIWindow(frame: UIScreen.main.bounds)
        window.tintColor = UIColor.gray
        
        self.window = window
        window.rootViewController = UINavigationController(rootViewController: HomeViewController())
        window.makeKeyAndVisible()
        
        return true
    }

}
