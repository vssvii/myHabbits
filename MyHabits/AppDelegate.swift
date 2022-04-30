//
//  AppDelegate.swift
//  MyHabits
//
//  Created by Ibragim Assaibuldayev on 12.04.2022.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    
    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        window = UIWindow()
        
        let habitsItem = UITabBarItem()
        habitsItem.title = "Привычки"
        habitsItem.image = UIImage(systemName: "rectangle.grid.1x2.fill")
        let habitsView = HabitsViewController()
        habitsView.tabBarItem = habitsItem
        let habitsViewNavigationController = UINavigationController(rootViewController: habitsView)
        
        let informationItem = UITabBarItem()
        informationItem.title = "Информация"
        informationItem.image = UIImage(systemName: "info.circle.fill")
        let informationView = InformationViewController()
        informationView.title = "Информация"
        informationView.tabBarItem = informationItem
        let informationViewNavigationController = UINavigationController(rootViewController: informationView)
        
        let tabBarController = UITabBarController()
        tabBarController.viewControllers = [habitsViewNavigationController, informationViewNavigationController]
        tabBarController.selectedIndex = 0
        window?.rootViewController = tabBarController
        window?.makeKeyAndVisible()
        
        return true
    }

}

