//
//  ViewController.swift
//  NavTest
//
//  Created by Adnane Jadid on 07.08.17.
//  Copyright © 2017 HSB. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var leftMenu: UIView!
    @IBOutlet weak var rightMenu: UIView!
    
    @IBOutlet weak var leadingConstraintRight: NSLayoutConstraint!
    @IBOutlet weak var leadingConstraintLeft: NSLayoutConstraint!
    
    @IBOutlet weak var testOption: UIButton!
    
    @IBOutlet var leftMenuGesture: UIScreenEdgePanGestureRecognizer!
    @IBOutlet var rightMenuGesture: UIScreenEdgePanGestureRecognizer!
    
    var showLeftMenu = false
    var showRightMenu = false
    
    let options = ["Option 1", "Option 2"]
    let identifiers = ["1","2"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        leftMenu.layer.shadowOpacity = 0.5
        leftMenu.layer.shadowRadius = 6
        
        rightMenu.layer.shadowOpacity = 1
        rightMenu.layer.shadowRadius = 6
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    @IBAction func handleLeftMenu(_ sender: UIScreenEdgePanGestureRecognizer) {
        if sender.state == .began && !showLeftMenu && !showRightMenu {
            appearLeftMenu()
        }
        
        if showRightMenu {
            hideRightMenu()
        }
    }
    
    @IBAction func handleRightMenu(_ sender: UIScreenEdgePanGestureRecognizer) {
        if sender.state == .began && !showRightMenu && !showLeftMenu {
            appearRightMenu()
        }
        
        if showLeftMenu {
            hideLeftMenu()
        }
    }
    
    @IBAction func handleTestOption(_ sender: UIButton) {
        hideLeftMenu()
        
        print("button tested")
    }
    
    func appearLeftMenu() {
        leadingConstraintLeft.constant = 0
        showLeftMenu = true
        
        UIView.animate(withDuration: 0.3, animations: {self.view.layoutIfNeeded()})
    }
    
    func hideLeftMenu() {
        leadingConstraintLeft.constant = -250
        showLeftMenu = false
        
        UIView.animate(withDuration: 0.3, animations: {self.view.layoutIfNeeded()})
    }
    
    func hideRightMenu() {
        leadingConstraintRight.constant = -250
        showRightMenu = false
        
        UIView.animate(withDuration: 0.3, animations: {self.view.layoutIfNeeded()})
    }
    
    func appearRightMenu() {
        leadingConstraintRight.constant = 0
        showRightMenu = true
    
        UIView.animate(withDuration: 0.3, animations: {self.view.layoutIfNeeded()})
    }
    
}

extension ViewController: UIGestureRecognizerDelegate {
    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldRecognizeSimultaneouslyWith otherGestureRecognizer: UIGestureRecognizer) -> Bool {
        return true
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return options.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .default, reuseIdentifier: "cell")
        cell.textLabel?.text = options[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedOption = identifiers[indexPath.row]
        
        print(selectedOption)
    }
}
