//
//  AppDelegate.swift
//  HW14_CollectionViewAndreiMaskal
//
//  Created by Andrei Maskal on 08/06/2022.
//

import UIKit
@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        window = UIWindow()
        window?.makeKeyAndVisible()
        window?.rootViewController = MainTabBarViewController()
      
        return true
    }
}
