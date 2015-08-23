//
//  EmergencyContactTableViewCell.swift
//  Panic
//
//  Created by Arpit Agarwal on 8/23/15.
//  Copyright (c) 2015 Ameri, Inc. All rights reserved.
//

import Foundation
import UIKit

class EmergencyContactTableViewCell: UITableViewCell {
    
    @IBOutlet weak var labelPhoneNumber: UILabel!
    @IBOutlet weak var fullName: MKLabel!
    var indexPath: NSIndexPath!
    var tapCallBack: ((indexPath: NSIndexPath) -> Void)!
    
    func load(fullNameString: String, phoneNumberString: String, indexPath: NSIndexPath, callback: (indexPath: NSIndexPath) -> Void) {
        
        fullName.text = fullNameString
        labelPhoneNumber.text = "Phone: \(phoneNumberString)"
        self.indexPath = indexPath
        tapCallBack = callback
        addGestureRecognizer(UITapGestureRecognizer(target: self, action: "didTapCell:"))
    }
    
    func didTapCell(sender: AnyObject) {
        
        tapCallBack(indexPath: indexPath)
    }
}