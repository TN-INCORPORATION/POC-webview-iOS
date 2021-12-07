//
//  AppDelegate.swift
//  WebViewPOC
//
//  Created by sarayuth.sa on 22/9/2564 BE.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        UserDefaults.standard.removeObject(forKey: Constants.targetAccountParamKey)
        UserDefaults.standard.removeObject(forKey: Constants.amountParamKey)
        
        UserDefaults.standard.removeObject(forKey: Constants.launchWithURLKey)
        
        UserDefaults.standard.synchronize()
        
        return true
    }
    
    func application(_ app: UIApplication, open url: URL, options: [UIApplication.OpenURLOptionsKey : Any] = [:]) -> Bool {
        print("URL = \(url.absoluteURL)")
        
        UserDefaults.standard.removeObject(forKey: Constants.targetAccountParamKey)
        UserDefaults.standard.removeObject(forKey: Constants.amountParamKey)
        
        UserDefaults.standard.set(url, forKey: Constants.launchWithURLKey)
        
        UserDefaults.standard.synchronize()
        
        
        return true
    }
    

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }


}

