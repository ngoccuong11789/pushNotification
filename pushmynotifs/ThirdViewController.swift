//
//  ThirdViewController.swift
//  pushmynotifs
//
//  Created by Rea Won Kim on 3/22/17.
//  Copyright © 2017 Rea Won Kim. All rights reserved.
//

import UIKit

class ThirdViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
      //NotificationCenter.default.addObserver(self, selector: #selector(ThirdViewController.pushToVC3), name: notificationName2, object: nil)
    }

  @IBAction func BackAction(_ sender: UIButton) {
    //self.performSegue(withIdentifier: "unwindToVC2", sender: self)
    pushToVC2()
  }

  
  func pushToVC2() {
    //performSegue(withIdentifier: "pushToVC3", sender: nil)
    guard let navigationController = navigationController else {return}
    guard let index = navigationController.viewControllers.index(of: self) else {return}
    let storyboard = UIStoryboard(name: "Main", bundle: nil)
    //    let VC1 = storyboard.instantiateViewController(withIdentifier: "VC1")
    let VC2 = storyboard.instantiateViewController(withIdentifier: "VC2")
    //navigationController.pushViewController(VC2, animated: true)
    navigationController.viewControllers.insert(VC2, at: index)
    navigationController.popViewController(animated: true)
  }

}
