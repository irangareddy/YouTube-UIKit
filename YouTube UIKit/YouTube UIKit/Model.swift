//
//  Model.swift
//  YouTube UIKit
//
//  Created by RANGA REDDY NUKALA on 13/06/20.
//  Copyright © 2020 RANGA REDDY NUKALA. All rights reserved.
//

import Foundation

class Model {

    func getVideos() {
            
        //    Create the URL Object
            
            let url = URL(string: Contants.API_URL)
            
        guard url != nil else {
                return
            }
            
            
        //    Get the URLSession object
            
            let session = URLSession.shared
            
            
        //    Get a data task from the URLSession Object
            
            let dataTask = session.dataTask(with: url!) { (data, response, error) in
                
                if error != nil || data != nil {
                    return print("✅ Got Data")
                }
                
                // Parse the data into Video Objects
                
                

            }
            
            
        //    Kick off the task
            
            dataTask.resume()
            
    }
    
}
