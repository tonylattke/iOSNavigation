//
//  LeftMenuViewController.swift
//  SWRevealView
//
//  Created by Tony Lattke on 08.08.17.
//  Copyright © 2017 HSB. All rights reserved.
//

import Foundation
import UIKit

class LeftMenuViewController: UIViewController {
    
    @IBOutlet weak var buttonLeftMenu: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func handleLeftButton(_ sender: Any) {
        let mainStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let desController = mainStoryboard.instantiateViewController(withIdentifier: "ViewController") as! ViewController
        let newFrontViewController = UINavigationController.init(rootViewController: desController)
        
        globalInt = globalInt + 1
        print(globalInt)
        
        revealViewController().pushFrontViewController(newFrontViewController, animated: true)
    }
    
    @IBAction func handleGesture(_ sender: UIScreenEdgePanGestureRecognizer) {
        let mainStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let desController = mainStoryboard.instantiateViewController(withIdentifier: "ViewController") as! ViewController
        let newFrontViewController = UINavigationController.init(rootViewController: desController)
        
        revealViewController().pushFrontViewController(newFrontViewController, animated: true)
    }
}
