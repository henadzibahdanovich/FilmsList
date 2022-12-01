//
//  AppDelegate.swift
//  IMDB-Pet
//
//  Created by Henadzi on 29/11/2022.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    let appCoordinator = AppCoordinator()
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = appCoordinator
        appCoordinator.start()
        window?.makeKeyAndVisible()

        return true
    }
}
