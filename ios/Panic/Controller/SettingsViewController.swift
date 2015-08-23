//
//  SettingsViewController.swift
//  Panic
//
//  Created by Arpit Agarwal on 8/23/15.
//  Copyright (c) 2015 Ameri, Inc. All rights reserved.
//

import Foundation
import UIKit

class SettingsViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Show the table view for settings
        setNavigationBarUI()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
    }
}

// IBActions

extension SettingsViewController {
    
    func didTapCancelButton(sender: AnyObject) {
        
        dismissViewControllerAnimated(true, completion: nil)
    }
}

// UI

extension SettingsViewController {
    
    func setNavigationBarUI() {
        
        // Background color.
        
        navigationController?.navigationBar.setBackgroundImage(UIImage(), forBarMetrics: UIBarMetrics.Default)
        navigationController?.navigationBar.shadowImage = UIImage()
        navigationController?.navigationBar.translucent = true
        
        // Set title
        
        let titleLabel = MKLabel(frame: CGRect(x: 0, y: 0, width: 100, height: 40))
        titleLabel.text = "Settings"
        titleLabel.textAlignment = NSTextAlignment.Center
        titleLabel.textColor = UIColor(red: 0.333, green: 0.333, blue: 0.333, alpha: 1.00)
        //        titleLabel.font = FONT_BEEPI_LIGHT
        navigationItem.titleView = titleLabel
                
        // Left bar button item
        
        let leftButton: UIButton = UIButton.buttonWithType(UIButtonType.Custom) as! UIButton
        leftButton.frame = CGRectMake(0, 0, 20, 20)
        
        leftButton.setImage(UIImage(named:"cross"), forState: UIControlState.Normal)
        leftButton.contentMode = UIViewContentMode.ScaleAspectFit
        leftButton.addTarget(self, action: "didTapCancelButton:", forControlEvents: UIControlEvents.TouchUpInside)
        
        var leftBarButtonItem: UIBarButtonItem = UIBarButtonItem(customView: leftButton)
        
        self.navigationItem.setLeftBarButtonItem(leftBarButtonItem, animated: false)
    }
}