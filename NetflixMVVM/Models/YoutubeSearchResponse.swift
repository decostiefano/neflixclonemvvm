//
//  YoutubeSearchResponse.swift
//  NetflixMVVM
//
//  Created by Jerry Purnama Maulid on 25/08/22.
//

import Foundation


/*
 items =     (
             {
         etag = "JaafUHXPf_SX1VJZ-netrw4L1vM";
         id =             {
             kind = "youtube#video";
             videoId = "FvhinEuNi_U";
         };
         kind = "youtube#searchResult";
     },
 */

struct YoutubeSearchResponse: Codable {
    let items: [VideoElement]
    
}


struct VideoElement: Codable {
    let id: IdVideoElement
}


struct IdVideoElement: Codable {
    let kind: String
    let videoId: String
}
