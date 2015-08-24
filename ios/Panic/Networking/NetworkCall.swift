//
//  RESTCall.swift
//  Panic
//
//  Created by Arpit Agarwal on 8/23/15.
//  Copyright (c) 2015 Ameri, Inc. All rights reserved.
//

import Foundation

func requestData(method: Method, endpoint: String, parameters: [String: AnyObject], callback: (AnyObject?) -> Void) -> Void {
    
    request(method, endpoint, parameters: parameters, encoding: ParameterEncoding.URL).responseJSON { (request, response, data, error) -> Void in
        if error == nil {
            
            callback(data)
        } else {
            println(error)
        }
    }
}
