//
//  Model.swift
//  YouTube UIKit
//
//  Created by RANGA REDDY NUKALA on 13/06/20.
//  Copyright © 2020 RANGA REDDY NUKALA. All rights reserved.
//

import Foundation

protocol ModelDelegate {
    func videosFetched(_ videos: [Video])
}



class Model {
    
    var delegate: ModelDelegate?

    func getVideos() {
            
        //    Create the URL Object
            
            let url = URL(string: Constants.API_URL)
            
            guard url != nil else {
                return
            }
            
            
        //    Get the URLSession object
            
            let session = URLSession.shared
            
            
        //    Get a data task from the URLSession Object
            
            let dataTask = session.dataTask(with: url!) { (data, response, error) in
                
                if error != nil || data == nil {
                    return 
                }
                
                // Parse the data into Video Objects
                do {
                    
                    let decoder = JSONDecoder()
                    decoder.dateDecodingStrategy = .iso8601
                    
                    let response = try decoder.decode(Response.self, from: data!)
                    
                    if response.items != nil {
                        
                        DispatchQueue.main.async {
                            self.delegate?.videosFetched(response.items!)
                        }
                        
                    }
                    
                    
                    
                } catch {
                    
                }
                
                
                

            }
            
            
        //    Kick off the task
            
            dataTask.resume()
            
    }
    
}
