//
//  MainTabBarViewController.swift
//  HW14_CollectionViewAndreiMaskal
//
//  Created by Andrei Maskal on 08/06/2022.
//

import UIKit

class MainTabBarViewController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        

        let albomController = PhotoColectionViewController(collectionViewLayout: UICollectionViewLayout())
        
        viewControllers = [
            generateNavigationController(rootViewController: ViewController(), title: "Медиатека", image: .init(named: "photo")!),
            generateNavigationController(rootViewController: ViewController(), title: "Для Вас", image: .init(named: "heart")!),
            generateNavigationController(rootViewController: albomController, title: "Альбомы", image: .init(named: "rectangle")!),
            generateNavigationController(rootViewController: ViewController(), title: "Поиск", image: .init(named: "magnifyingglass")!)]
    
    if #available(iOS 15, *) {
        let tabBarAppearance = UITabBarAppearance()
        tabBarAppearance.configureWithDefaultBackground()
        UITabBar.appearance().standardAppearance = tabBarAppearance
        UITabBar.appearance().scrollEdgeAppearance = tabBarAppearance
    }
}
    private func generateNavigationController(rootViewController: UIViewController, title: String, image: UIImage) -> UIViewController {
        let navigationViewController = UINavigationController(rootViewController: rootViewController)
        navigationViewController.tabBarItem.title = title
        navigationViewController.tabBarItem.image = image
        
        
        return navigationViewController
        
    }
}
