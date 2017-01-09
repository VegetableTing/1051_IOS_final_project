//
//  LoveTableViewCell.swift
//  Ting
//
//  Created by user_05 on 2016/12/20.
//  Copyright © 2016年 user_03. All rights reserved.
//

import UIKit

class LoverTableViewCell: UITableViewCell {

    

    @IBOutlet weak var photoImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!

    @IBOutlet weak var timeLabel: UILabel!

    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
