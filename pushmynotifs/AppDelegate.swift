//
//  AppDelegate.swift
//  pushmynotifs
//
//  Created by Rea Won Kim on 3/22/17.
//  Copyright © 2017 Rea Won Kim. All rights reserved.
//

import UIKit
import Firebase
import FirebaseInstanceID
import FirebaseMessaging
@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
  
  var window: UIWindow?
  //var navigationController: UINavigationController?
  
  func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
    // Override point for customization after application launch.
    if #available(iOS 8.0, *) {
      let settings : UIUserNotificationSettings = UIUserNotificationSettings(types: [.alert, .badge, .sound], categories: nil)
      application.registerUserNotificationSettings(settings)
      application.registerForRemoteNotifications()
    }else {
      let types : UIRemoteNotificationType = [.alert, .badge, . sound]
      application.registerForRemoteNotifications(matching: types)
    }
    FIRApp.configure()
    NotificationCenter.default.addObserver(self, selector: #selector(self.tokenRefreshNotification(notification:)), name: NSNotification.Name.firInstanceIDTokenRefresh, object: nil)
    return true
  }
  
  func applicationWillResignActive(_ application: UIApplication) {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
  }
  
  func applicationDidEnterBackground(_ application: UIApplication) {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    FIRMessaging.messaging().disconnect()
  }
  
  func applicationWillEnterForeground(_ application: UIApplication) {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
  }
  
  func applicationDidBecomeActive(_ application: UIApplication) {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    connectToFCM()
  }
  
  func applicationWillTerminate(_ application: UIApplication) {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
  }
  
  func tokenRefreshNotification(notification : NSNotification) {
    let refreshedToken = FIRInstanceID.instanceID().token()!
    print("InstanceID Token : \(refreshedToken)")
    connectToFCM()
    
  }
  
  func connectToFCM() {
    FIRMessaging.messaging().connect { (error) in
      if (error != nil) {
        print("Unable to connect to FCM : \(error)")
      }else {
        print("Connected to FCM")
      }
    }
  }
  
  func application(_ application: UIApplication, didReceiveRemoteNotification userInfo: [AnyHashable : Any], fetchCompletionHandler completionHandler: @escaping (UIBackgroundFetchResult) -> Void) {
    if application.applicationState == UIApplicationState.inactive || application.applicationState == UIApplicationState.background {
      //opened from a push notification when the app was on background
      print("User Info : \(userInfo)")
      
      guard let value = userInfo["key"] as? String else {
        return
      }
      print("User Info key : \(value)")
//      guard let navigationController = navigationController else {return}
//      let storyboard = UIStoryboard(name: "Main", bundle: nil)
//      let VC1 = storyboard.instantiateViewController(withIdentifier: "VC1")
      if value == "VC1" {
        print("VC1")
        
        //navigationController.viewControllers.insert(VC1, at: 0)
      }else if value == "VC2"{
        print("VC2")
//        let VC2 = storyboard.instantiateViewController(withIdentifier: "VC2")
//        navigationController.viewControllers.insert(VC1, at: 0)
//        navigationController.viewControllers.insert(VC2, at: 0)
//        navigationController.pushViewController(VC2, animated: true)
//        NotificationCenter.default.post(name: notificationName1, object: nil)
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc2 = storyboard.instantiateViewController(withIdentifier: "VC2")
        window?.rootViewController = UINavigationController(rootViewController: vc2)

      }else{
        print("VC3")
        //NotificationCenter.default.post(name: notificationName2, object: nil)
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc3 = storyboard.instantiateViewController(withIdentifier: "VC3")
        window?.rootViewController = UINavigationController(rootViewController: vc3)
        
      }
    }else {
      print("afdas")
    }
  }
  
  func popToLoginView(_ navigationController: UINavigationController) -> Bool {
    for vc in navigationController.viewControllers {
      if vc is ViewController {
        navigationController.popToViewController(vc, animated: true)
        return true
      }
    }
    return false
  }
}

