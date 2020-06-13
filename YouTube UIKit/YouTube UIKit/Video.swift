//
//  Video.swift
//  YouTube UIKit
//
//  Created by RANGA REDDY NUKALA on 13/06/20.
//  Copyright © 2020 RANGA REDDY NUKALA. All rights reserved.
//

import Foundation

struct Video: Decodable {
    
    var videoId = ""
    var title = ""
    var description = ""
    var thumbnail = ""
    var published = Date()
    
    
    enum CodingKeys: String, CodingKey {
        
        case snippet
        case thumbnails
        case high
        case resourceId
        
        case videoId
        case title
        case description
        case thumbnail = "url"
        case published = "publishedAt"
        
        
    }
    
    
    init(from decoder: Decoder) throws {
        
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        let snippetContainer = try container.nestedContainer(keyedBy: CodingKeys.self, forKey: .snippet)
        
        // Parse Title
        
        self.title = try snippetContainer.decode(String.self, forKey: .title)
        
        // Parse Description
        
        self.description = try snippetContainer.decode(String.self, forKey: .description)
        
        // Parse Pusblished
        
        self.published = try snippetContainer.decode(Date.self, forKey: .published)
        
        
        
        let thumbnailsContainer =  try snippetContainer.nestedContainer(keyedBy: CodingKeys.self, forKey: .thumbnails)
        
        let highContainer = try thumbnailsContainer.nestedContainer(keyedBy: CodingKeys.self, forKey: .high)
        
        // Parse thumbnail
        
        self.thumbnail = try highContainer.decode(String.self, forKey: .thumbnail)
        
        
        let resourceIdContainer =  try snippetContainer.nestedContainer(keyedBy: CodingKeys.self, forKey: .resourceId)
        
        // Parse VideoId
        
        self.videoId = try resourceIdContainer.decode(String.self, forKey: .videoId)
               
        
       
        
    }
    
}
