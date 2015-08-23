//
//  Location.swift
//  Panic
//
//  Created by Arpit Agarwal on 8/23/15.
//  Copyright (c) 2015 Ameri, Inc. All rights reserved.
//

import Foundation
import CoreLocation

class LocationManager: NSObject, CLLocationManagerDelegate {
    
    var locationManager: CLLocationManager!
    var seenError : Bool = false
    var locationFixAchieved : Bool = false
    var locationStatus : NSString = "Not Started"

    var presentLocation: CLLocationCoordinate2D!
    var foundPresentLocationCallback: ((location: CLLocationCoordinate2D?, addressString: String?) -> Void)!
    
    // Location Manager helper stuff
    
    func initLocationManager(foundFreshLocation: (location: CLLocationCoordinate2D?, addressString: String?) -> Void) {
        
        self.foundPresentLocationCallback = foundFreshLocation

        seenError = false
        locationFixAchieved = false
        locationManager = CLLocationManager()
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestAlwaysAuthorization()
    }
    
    // Location Manager Delegate stuff
    // If failed
    
    func locationManager(manager: CLLocationManager!, didFailWithError error: NSError!) {
        
        locationManager.stopUpdatingLocation()
        
        if ((error) != nil) {
            if (seenError == false) {
                seenError = true
                print(error)
            }
            
            // Error in finding the 2D location
            
            self.foundPresentLocationCallback(location: nil, addressString: nil)
        }
    }
    
    func locationManager(manager: CLLocationManager!, didUpdateLocations locations: [AnyObject]!) {
        
        if (locationFixAchieved == false) {
            locationFixAchieved = true
            var locationArray = locations as NSArray
            var locationObj = locationArray.lastObject as! CLLocation
            var coord : CLLocationCoordinate2D = locationObj.coordinate
            
            println(coord.latitude)
            println(coord.longitude)
            
            presentLocation = coord
            
            getAddressFromGeocode(presentLocation) { (addressString: String?) -> Void in
                
                println(addressString)
                
                if let address = addressString {
                    self.foundPresentLocationCallback(location: self.presentLocation, addressString: address)
                }
            }
        }
    }
    
    // authorization status
    
    func locationManager(manager: CLLocationManager!, didChangeAuthorizationStatus status: CLAuthorizationStatus) {
            
            var shouldIAllow = false
            
            switch status {
                
            case CLAuthorizationStatus.Restricted:
                locationStatus = "Restricted Access to location"
            case CLAuthorizationStatus.Denied:
                locationStatus = "User denied access to location"
            case CLAuthorizationStatus.NotDetermined:
                locationStatus = "Status not determined"
            default:
                locationStatus = "Allowed to location Access"
                shouldIAllow = true
            }
        
            NSNotificationCenter.defaultCenter().postNotificationName("LabelHasbeenUpdated", object: nil)
        
            if (shouldIAllow == true) {
                
                NSLog("Allow location services")
                // Start location services
                locationManager.startUpdatingLocation()
            } else {
                
                NSLog("Denied access: \(locationStatus)")
            }
    }
}

