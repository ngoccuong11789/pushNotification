//
//  ViewController.swift
//  pushmynotifs
//
//  Created by Rea Won Kim on 3/22/17.
//  Copyright © 2017 Rea Won Kim. All rights reserved.
//

import UIKit
import Firebase
import FirebaseInstanceID
import FirebaseMessaging
class ViewController: UIViewController {

  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.
    FIRMessaging.messaging().subscribe(toTopic: "/topics/news")
    print("viewDidLoad")
    
    NotificationCenter.default.addObserver(self, selector: #selector(ViewController.pushToVC2), name: notificationName1, object: nil)
//    NotificationCenter.default.addObserver(self, selector: #selector(ThirdViewController.pushToVC3), name: notificationName2, object: nil)
  }
  
  func pushToVC2() {
    //performSegue(withIdentifier: "pushToVC2", sender: nil)
    guard let navigationController = navigationController else {return}
    guard let index = navigationController.viewControllers.index(of: self) else {return}
    let storyboard = UIStoryboard(name: "Main", bundle: nil)
    let VC2 = storyboard.instantiateViewController(withIdentifier: "VC2")
    navigationController.pushViewController(VC2, animated: true)
  }
  
//  func pushToVC3() {
//    //performSegue(withIdentifier: "pushToVC3", sender: nil)
//    guard let navigationController = navigationController else {return}
//    guard let index = navigationController.viewControllers.index(of: self) else {return}
//    let storyboard = UIStoryboard(name: "Main", bundle: nil)
//    //    let VC1 = storyboard.instantiateViewController(withIdentifier: "VC1")
//    let VC2 = storyboard.instantiateViewController(withIdentifier: "VC2")
//    //navigationController.pushViewController(VC2, animated: true)
//    navigationController.viewControllers.insert(VC2, at: index)
//    navigationController.popViewController(animated: true)
//  }
  
  @IBAction func next(_ sender: Any) {
    performSegue(withIdentifier: "pushToVC2", sender: nil)
  }

  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    print("viewWillAppear")
  }

  @IBAction func unwindToVC1(segue: UIStoryboardSegue) {}


}

