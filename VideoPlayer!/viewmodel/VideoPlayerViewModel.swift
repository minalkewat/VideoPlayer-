//
//  VideoPlayerViewModel.swift
//  VideoPlayer!
//
//  Created by apple on 01/04/20.
//  Copyright © 2020 apple. All rights reserved.
//

import Foundation
import AVKit
import UIKit


enum VideoPlayerViewModelItemType{
    
    case playlist
    case commentSection
}

protocol VideoPlayerViewModelItem {
    var type: VideoPlayerViewModelItemType { get }
    var sectionTitle : String { get }
    var rowCount : Int { get }
}

class VideoPlayerViewModel: NSObject {
    var items = [VideoPlayerViewModelItem]()
    
    let videoDictData:[String:Any] = ["links":[VIDEOSTRING.VideoData.v1Link,VIDEOSTRING.VideoData.v2Link,VIDEOSTRING.VideoData.v3Link,VIDEOSTRING.VideoData.v4Link], "comments":[VIDEOSTRING.VideoData.comment]]
 
    var player:AVPlayer!
    var playerLayer:AVPlayerLayer!
    
   override init() {
        super.init()
    let videPlayerData = VideoPlayerData(dict: videoDictData)
    loadVideoPlaylist(data: videPlayerData)
    loadComments(data: videPlayerData)
       
    }

    
    func loadVideoPlaylist(data:VideoPlayerData){
        let playlist = VideoPlayList(videoPlayer: data)
        items.append(playlist)
    }
    
    func loadComments(data:VideoPlayerData){
        let comments = VideoCommentSection(videoPlayer: data)
        items.append(comments)
    }
}

class VideoPlayList: VideoPlayerViewModelItem{
    var type: VideoPlayerViewModelItemType{
        return .playlist
    }
    
    var sectionTitle: String{
        return ""
    }
    
    var rowCount: Int {
        return  videoPlayer.videoLink?.count ?? 0
    }
    
    var videoPlayer:VideoPlayerData
    
    init(videoPlayer:VideoPlayerData) {
        self.videoPlayer = videoPlayer
    }
    
    
}

class VideoCommentSection: VideoPlayerViewModelItem{
    var type: VideoPlayerViewModelItemType{
        return .commentSection
    }
    
    var sectionTitle: String{
        return ""
    }
    
    var rowCount: Int {
        return  10
    }
    
    var videoPlayer:VideoPlayerData
    
    init(videoPlayer:VideoPlayerData) {
        self.videoPlayer = videoPlayer
    }
}
