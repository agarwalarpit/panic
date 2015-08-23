//
//  AlertForUserLocation.swift
//  Panic
//
//  Created by Arpit Agarwal on 8/23/15.
//  Copyright (c) 2015 Ameri, Inc. All rights reserved.
//

import Foundation

func alertEveryoneForUser(userName: String) -> Void {
    
    callANumber("2174171142")
    
    locationManager.initLocationManager { (location, addressString) -> Void in
        
        // Text location to people.

        sendMessage("I'm in danger. Help me! SOS. My name is : \(userName)", addressString, ["2174171142"])
    }
}