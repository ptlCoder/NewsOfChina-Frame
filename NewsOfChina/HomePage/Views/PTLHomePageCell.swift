//
//  PTLHomePageCell.swift
//  NewsOfChina
//
//  Created by soliloquy on 2018/6/24.
//  Copyright © 2018年 soliloquy. All rights reserved.
//

import UIKit
import Kingfisher

class PTLHomePageCell: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var attAbstractLabel: UILabel!
    
    @IBOutlet weak var bigPicImageView: UIImageView!
    
    @IBOutlet weak var timeLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    var model: PTLHomePageModel? {
        didSet {
            titleLabel.text = model?.title
            attAbstractLabel.text = model?.attAbstract
            bigPicImageView.kf.setImage(with: URL(string: (model?.picMiddle)!))
            timeLabel.text = model?.publishtime
        }
    }
    
    
    
    
    
}
