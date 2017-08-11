//
//  ViewController.swift
//  SWRevealView
//
//  Created by Tony Lattke on 08.08.17.
//  Copyright © 2017 HSB. All rights reserved.
//

import UIKit

var globalInt = 0

class ViewController: UIViewController {

    @IBOutlet weak var buttonMenu: UIBarButtonItem!
    @IBOutlet weak var buttonRightMenu: UIBarButtonItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        buttonMenu.target = revealViewController()
        buttonMenu.action = #selector(SWRevealViewController.revealToggle(_:))
        
        buttonRightMenu.target = revealViewController()
        buttonRightMenu.action = #selector(SWRevealViewController.rightRevealToggle(_:))
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

}

