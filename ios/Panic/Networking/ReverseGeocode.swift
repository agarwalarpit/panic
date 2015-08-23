//
//  ReverseGeocode.swift
//  Panic
//
//  Created by Arpit Agarwal on 8/23/15.
//  Copyright (c) 2015 Ameri, Inc. All rights reserved.
//

import Foundation
import CoreLocation

func getAddressFromGeocode(location: CLLocationCoordinate2D?, callback: String? -> Void) {
    
    let baseUrlString: String = "https://maps.googleapis.com/maps/api/geocode/json?"
    
    if let loc = location {
        
        let parameters: [String: String] = [
            "latlng": "\(loc.latitude),\(loc.longitude)"
        ]
        
        requestData(.GET, baseUrlString, parameters) { (data: AnyObject?) -> Void in
            
            let jsonData: JSON = JSON(data!)
            let results: [JSON] = jsonData["results"].arrayValue
            let formattedAddress: String = results[0]["formatted_address"].stringValue
            
            callback(formattedAddress)
        }
    } else {
        
        callback(nil)
    }
}