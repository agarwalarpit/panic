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
    
    @IBOutlet weak var textFieldLastName: MKTextField!
    @IBOutlet weak var textFieldFirstName: MKTextField!
    @IBOutlet weak var tableView: UITableView!
    
    var nameArray: [String] = ["Arpit Agarwal", "Anil Agarwal"]
    var phoneArray: [String] = ["+1 (217) 417-1142", "+1 (217) 417-1142"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Show the table view for settings
        setNavigationBarUI()
        setTextFieldUI(textFieldLastName)
        setTextFieldUI(textFieldFirstName)
        setTableViewUI()
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
    
    @IBAction func didTapAddContact(sender: AnyObject) {
        
        
    }
    
    func didTapCancelButton(sender: AnyObject) {
        
        dismissViewControllerAnimated(true, completion: nil)
    }
}

// Tableview delegate / data-source

extension SettingsViewController : UITableViewDelegate, UITableViewDataSource {
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell : EmergencyContactTableViewCell = tableView.dequeueReusableCellWithIdentifier("EmergencyContactTableViewCell", forIndexPath: indexPath) as! EmergencyContactTableViewCell
        
        cell.load(nameArray[indexPath.row], phoneNumberString: phoneArray[indexPath.row], indexPath: indexPath) { (indexPath) -> Void in
            
            let removeAction = UIAlertAction(title: "Remove \(self.nameArray[indexPath.row])", style: UIAlertActionStyle.Destructive) { (alertAction) -> Void in
                //
                
                self.nameArray.removeAtIndex(indexPath.row)
                self.phoneArray.removeAtIndex(indexPath.row)
                self.tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: UITableViewRowAnimation.Fade)
                
                backgroundThread(delay: 0.2, background: { () -> Void in
                    self.tableView.reloadData()
                }, completion: nil)
            }
            
            let cancelAction = UIAlertAction(title: "Cancel", style: UIAlertActionStyle.Cancel, handler: nil)
            
            let alertController = UIAlertController(title: "Remove an emergency contact", message: nil, preferredStyle: UIAlertControllerStyle.ActionSheet)
            
            alertController.addAction(cancelAction)
            alertController.addAction(removeAction)
            
            self.presentViewController(alertController, animated: true, completion: nil)
        }

        return cell
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return nameArray.count
    }
    
    func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 40.0
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 120.0
    }
    
    func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Information"
    }
    
    func tableView(tableView: UITableView, shouldShowMenuForRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        return true
    }
    
    func tableView(tableView: UITableView, shouldHighlightRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        return (indexPath.row % 2 != 0)
    }
    
}

// UI

extension SettingsViewController {
    
    func setTableViewUI() {
        
        tableView.delegate = self
        tableView.dataSource = self
        
        var tblView =  UIView(frame: CGRectZero)
        tableView.tableFooterView = tblView
        tableView.tableFooterView!.hidden = true
        tableView.backgroundColor = UIColor.clearColor()
        
        tableView.registerNib(UINib(nibName: "EmergencyContactTableViewCell", bundle: nil), forCellReuseIdentifier: "EmergencyContactTableViewCell")
    }
    
    func setTextFieldUI(textField: MKTextField) {
    
        textField.rippleLocation = .Left
        textField.floatingPlaceholderEnabled = true
        textField.placeholder = "As on passport"
        textField.rippleLayerColor = UIColor.MKColor.Grey

        textField.layer.borderColor = UIColor.clearColor().CGColor
    }
    
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