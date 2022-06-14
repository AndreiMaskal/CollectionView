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
    
        let albomController = AlbumViewController()
        let searchController = SearchViewController()
        let forYouController = ForYouViewController()
        let mediatekaController = MediatekaViewController()
        
        viewControllers = [
            generateNavigationController(rootViewController: mediatekaController, title: "Медиатека", image: UIImage(systemName: "photo.on.rectangle")),
            generateNavigationController(rootViewController: forYouController, title: "Для Вас", image: UIImage(systemName: "heart.text.square")),
            generateNavigationController(rootViewController: albomController, title: "Альбомы", image: UIImage(systemName: "rectangle.stack.fill")),
            generateNavigationController(rootViewController: searchController, title: "Поиск", image: UIImage(systemName: "magnifyingglass"))]
    
    if #available(iOS 15, *) {
        let tabBarAppearance = UITabBarAppearance()
        tabBarAppearance.configureWithDefaultBackground()
        UITabBar.appearance().standardAppearance = tabBarAppearance
        UITabBar.appearance().scrollEdgeAppearance = tabBarAppearance
    }
}
    private func generateNavigationController(rootViewController: UIViewController, title: String, image: UIImage?) -> UIViewController {
        let navigationViewController = UINavigationController(rootViewController: rootViewController)
        
        navigationViewController.tabBarItem.title = title
        navigationViewController.tabBarItem.image = image
    
        return navigationViewController
    }
}
