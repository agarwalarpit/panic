//
//  SendMessage.swift
//  Panic
//
//  Created by Arpit Agarwal on 8/23/15.
//  Copyright (c) 2015 Ameri, Inc. All rights reserved.
//

import Foundation

func sendMessageWithTextAndLocationToGivenPhoneNumbers(textMessage: String, addressString: String?, destinationPhoneNumbers: [String]) {
    
    println(textMessage)
    println(addressString)
    
    var messageString = "\(textMessage)"
    
    if let address = addressString {
        messageString += "and I'm near \(address)"
    }
    
    let phoneMessageEndpoint: String = "https://rest.nexmo.com/sms/json?"
    
    destinationPhoneNumbers.map {
        (var phoneNumber) -> Void in
        
        let parameters: [String: String] = [
            "api_key": "409054e1",
            "api_secret": "11ba74f0",
            "from": "12028388644",
            "to": "\(phoneNumber)",
            "text": messageString
        ]
        
        requestData(.GET, phoneMessageEndpoint, parameters) { (data) -> Void in
            println(data)
        }
    }
}
