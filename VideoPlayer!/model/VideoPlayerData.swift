//
//  VideoPlayerData.swift
//  VideoPlayer!
//
//  Created by apple on 01/04/20.
//  Copyright © 2020 apple. All rights reserved.
//

import Foundation


struct VideoPlayerData {
    var videoLink:[String]?
    var comments:[String]?
    
     init(dict: [String: Any]){
        self.videoLink = dict["links"] as? [String]
        self.comments = dict["comments"] as? [String]
    }
}
