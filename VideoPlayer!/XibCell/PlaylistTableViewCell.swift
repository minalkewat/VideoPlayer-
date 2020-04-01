//
//  PlaylistTableViewCell.swift
//  VideoPlayer!
//
//  Created by apple on 01/04/20.
//  Copyright © 2020 apple. All rights reserved.
//

import UIKit

class PlaylistTableViewCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    static func registerXib(with tableView:UITableView){
        let nib = UINib(nibName: String(describing: self), bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "playlistTableViewCell")
    }
    
}
