//
//  SecondViewController.swift
//  pushmynotifs
//
//  Created by Rea Won Kim on 3/22/17.
//  Copyright © 2017 Rea Won Kim. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }


  @IBAction func nextBtn(_ sender: Any) {
    performSegue(withIdentifier: "VC2pushToVC3", sender: nil)
  }
  @IBAction func backToVC1(_ sender: UIButton) {
    //self.performSegue(withIdentifier: "unwindToVC1", sender: self)
    pushToVC1()
  }
  
  @IBAction func unwindToVC2(segue: UIStoryboardSegue) {}

  func pushToVC1() {
    //performSegue(withIdentifier: "pushToVC3", sender: nil)
    guard let navigationController = navigationController else {return}
    guard let index = navigationController.viewControllers.index(of: self) else {return}
    let storyboard = UIStoryboard(name: "Main", bundle: nil)
    let VC1 = storyboard.instantiateViewController(withIdentifier: "VC1")
    navigationController.viewControllers.insert(VC1, at: index)
    navigationController.popViewController(animated: true)
  }

  
  
}
