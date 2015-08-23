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
        
        self.informationLabel.text = "Calling your emergency contact ... "
        
        UIView.animateWithDuration(0.2, animations: { () -> Void in
            self.informationLabel.alpha = 1.0
        })
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
}
