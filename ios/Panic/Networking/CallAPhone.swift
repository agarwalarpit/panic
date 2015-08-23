//
//  CallAPhone.swift
//  Panic
//
//  Created by Arpit Agarwal on 8/23/15.
//  Copyright (c) 2015 Ameri, Inc. All rights reserved.
//

import Foundation
import UIKit

func callANumber(phoneNumber: Int) -> Void {
    
    if let url = NSURL(string: "tel://\(phoneNumber)") {
        UIApplication.sharedApplication().openURL(url)
    }
}