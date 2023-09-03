//
//  CustomTabBarController.swift
//  AppStoreClone
//
//  Created by Kaan Odabaş on 26.08.2023.
//

import UIKit

class MainTabBarViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        let vc1 = UINavigationController(rootViewController: TodayViewController())
        let vc2 = UINavigationController(rootViewController: GamesViewController())
        let vc3 = UINavigationController(rootViewController: AppsViewController())
        let vc4 = UINavigationController(rootViewController: ArcadeViewController())
        let vc5 = UINavigationController(rootViewController: SearchViewController())
        
        vc1.tabBarItem.image = UIImage(systemName: "newspaper.fill")
        vc2.tabBarItem.image = UIImage(systemName: "gamecontroller.fill")
        vc3.tabBarItem.image = UIImage(systemName: "square.stack.3d.up.fill")
        vc4.tabBarItem.image = UIImage(systemName: "playstation.logo")
        vc5.tabBarItem.image = UIImage(systemName: "magnifyingglass")
        
        vc1.title = "Today"
        vc2.title = "Games"
        vc3.title = "Apps"
        vc4.title = "Arcade"
        vc5.title = "Search"
        
        
        setViewControllers([vc1, vc2, vc3, vc4, vc5], animated: true)

    }


}
