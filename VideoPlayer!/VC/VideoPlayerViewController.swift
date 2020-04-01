//
//  VideoPlayerViewController.swift
//  VideoPlayer!
//
//  Created by apple on 01/04/20.
//  Copyright © 2020 apple. All rights reserved.
//

import UIKit
import AVKit
import WebKit


class VideoPlayerViewController: UIViewController {
    @IBOutlet weak var customVideoPlayer: UIView!
    @IBOutlet weak var playlistView: UITableView!
    @IBOutlet weak var webview: WKWebView!
    
    var player:AVPlayer!
    var playerLayer:AVPlayerLayer!
    var isVideoPlaying = true
    
  fileprivate let viewModel = VideoPlayerViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
     // autoPlayVideo(link: VIDEOSTRING.VideoData.v1Link)
     
    loadVideo(link: VIDEOSTRING.VideoData.v1Link)
      registerNib()
    }
    
    func loadVideo(link:String){
        if   let url = URL (string: link){
             let requestObj = URLRequest(url: url)
            webview.configuration.allowsInlineMediaPlayback = true
             webview.load(requestObj)
        }
    }
    
    
    func registerNib(){
        PlaylistTableViewCell.registerXib(with: playlistView)
        CommentsTableViewCell.registerXib(with: playlistView)
    }
    
//    func autoPlayVideo(link:String){
//        guard  let url = URL(string: link) else {return}
//              player = AVPlayer(url: url)
//              playerLayer = AVPlayerLayer(player: player)
//              playerLayer.videoGravity = .resize
//
//              customVideoPlayer.layer.addSublayer(playerLayer)
//    }

    
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
       // player.play()
    }
    
}


extension VideoPlayerViewController:UITableViewDataSource , UITableViewDelegate{
    func numberOfSections(in tableView: UITableView) -> Int {
        return viewModel.items.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.items[section].rowCount
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var tableCell: UITableViewCell!
             let item = viewModel.items[indexPath.section]
             switch item.type {
             case .playlist:
                tableCell = self.tableView(tableView, playlistCell: indexPath, item:item as! VideoPlayList)
             case .commentSection:
                tableCell = self.tableView(tableView, commentsCell: indexPath, item:item as! VideoCommentSection)
        }
        return tableCell
    }
    
    func tableView(_ tableView: UITableView, playlistCell indexPath: IndexPath,item:VideoPlayList) -> UITableViewCell {
          let cell: PlaylistTableViewCell = tableView.dequeueReusableCell(withIdentifier: "playlistTableViewCell", for: indexPath) as! PlaylistTableViewCell
         //  cell.selectionStyle = .none
          return cell
      }
    
    func tableView(_ tableView: UITableView, commentsCell indexPath: IndexPath,item:VideoCommentSection) -> UITableViewCell {
            let cell: CommentsTableViewCell = tableView.dequeueReusableCell(withIdentifier: "commentsTableViewCell", for: indexPath) as! CommentsTableViewCell
        cell.commentLbl.text = VIDEOSTRING.VideoData.comment
        cell.selectionStyle = .none
           //  cell.selectionStyle = .none
            return cell
        }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
       // customVideoPlayer.layer.sublayers?.removeAll()
       // self.viewDidLayoutSubviews()
        if indexPath.row < 4{
            let links = viewModel.videoDictData["links"] as? [String]
                   
                   if let selectedLink = links?[indexPath.row] {
                       loadVideo(link: selectedLink)
                   }
        }
    }
    
}

