//
//  ViewController.swift
//  Panic
//
//  Created by Arpit Agarwal on 8/23/15.
//  Copyright (c) 2015 Ameri, Inc. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var panicButton: MKButton!
    @IBOutlet weak var informationLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        setButtonUI()
        setNavigationBarUI()
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        setInformationLabelUI()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

// IBActions 

extension ViewController {

    @IBAction func didTapPanicButton(sender: AnyObject) {
        
        println("Tapped panic button")
        
        self.informationLabel.text = "Calling the local police ... "
        
        UIView.animateWithDuration(0.2, animations: { () -> Void in
            self.informationLabel.alpha = 1.0
        }) { (finished) -> Void in
            if finished {
                UIView.animateWithDuration(3.0, animations: { () -> Void in
                    self.informationLabel.alpha = 0.0
                })
            }
        }
        
        alertEveryoneForUser("Arpit Agarwal")
    }
    
    func didTapSettingsButton(sender: AnyObject) {
        
        let vc = storyboard?.instantiateViewControllerWithIdentifier("SettingsViewControllerNAV") as! UINavigationController
        presentViewController(vc, animated: true, completion: nil)
    }
}

// UI

extension ViewController {
    
    func setButtonUI() {
        
        panicButton.layer.cornerRadius = panicButton.frame.width / 2
        panicButton.layer.shadowOffset = CGSize(width: 10, height: 10)
        panicButton.layer.shadowRadius = 20.0
        panicButton.layer.shadowOpacity = 0.2
        
    }
    
    func setInformationLabelUI() {
        
        informationLabel.alpha = 0.0
    }
    
    func setNavigationBarUI() {
        
        // Background color.
        
        navigationController?.navigationBar.setBackgroundImage(UIImage(), forBarMetrics: UIBarMetrics.Default)
        navigationController?.navigationBar.shadowImage = UIImage()
        navigationController?.navigationBar.translucent = true
        
        // Set title
        
        let titleLabel = MKLabel(frame: CGRect(x: 0, y: 0, width: 100, height: 40))
        titleLabel.text = "Make a distress call"
        titleLabel.textAlignment = NSTextAlignment.Center
        titleLabel.textColor = UIColor(red: 0.333, green: 0.333, blue: 0.333, alpha: 1.00)
//        titleLabel.font = FONT_BEEPI_LIGHT
        navigationItem.titleView = titleLabel
        
        // Right bar button item
        
        let buttonCancel: UIButton = UIButton.buttonWithType(UIButtonType.Custom) as! UIButton
        buttonCancel.frame = CGRectMake(0, 0, 33, 33)
        
        buttonCancel.setImage(UIImage(named:"settings"), forState: UIControlState.Normal)
        buttonCancel.contentMode = UIViewContentMode.ScaleAspectFit
        buttonCancel.addTarget(self, action: "didTapSettingsButton:", forControlEvents: UIControlEvents.TouchUpInside)
        
        var rightBarButtonItem: UIBarButtonItem = UIBarButtonItem(customView: buttonCancel)
        
        self.navigationItem.setRightBarButtonItem(rightBarButtonItem, animated: false)
        
        
        // Left bar button item
        
        let leftButton: UIButton = UIButton.buttonWithType(UIButtonType.Custom) as! UIButton
        leftButton.frame = CGRectMake(0, 0, 27, 20)
        
        leftButton.setImage(UIImage(named:"left_arrow"), forState: UIControlState.Normal)
        leftButton.contentMode = UIViewContentMode.ScaleAspectFit
//        leftButton.addTarget(self, action: "didTapPreviousView:", forControlEvents: UIControlEvents.TouchUpInside)
        
        var leftBarButtonItem: UIBarButtonItem = UIBarButtonItem(customView: leftButton)
        
        self.navigationItem.setLeftBarButtonItem(leftBarButtonItem, animated: false)
    }
}
