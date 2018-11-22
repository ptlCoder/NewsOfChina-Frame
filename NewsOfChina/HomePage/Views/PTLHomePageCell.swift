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

    
    lazy var titleLabel: UILabel = {
        let titleLabel = UILabel()
        titleLabel.numberOfLines = 0
        return titleLabel
    }()
    
    
    lazy var attAbstractLabel: UILabel = {
        let attAbstractLabel = UILabel()
        return attAbstractLabel
    }()
    
    lazy var bigPicImageView: UIImageView = {
        let bigPicImageView = UIImageView()
        bigPicImageView.layer.cornerRadius = 8
        bigPicImageView.layer.masksToBounds = true
        return bigPicImageView
    }()
    
    lazy var timeLabel: UILabel = {
        let timeLabel = UILabel()
        timeLabel.numberOfLines = 1
        timeLabel.textAlignment = .right
        return timeLabel
    }()
    
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
       contentView.addSubview(titleLabel)
       contentView.addSubview(attAbstractLabel)
       contentView.addSubview(bigPicImageView)
       contentView.addSubview(timeLabel)

    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        

    }

    var cellLayout: PTLHomePageCellLayout? {
        didSet {
            // Rect布局
            titleLabel.frame = (cellLayout?.titleLabelRect)!
            attAbstractLabel.frame = (cellLayout?.attAbstractLabelRect)!
            bigPicImageView.frame = (cellLayout?.bigPicImageViewRect)!
            timeLabel.frame = (cellLayout?.timeLabelRect)!
            // 设置数据
            titleLabel.text = cellLayout?.model?.title
            attAbstractLabel.text = cellLayout?.model?.attAbstract
            bigPicImageView.kf.setImage(with: URL(string: (cellLayout?.model?.picMiddle)!))
            timeLabel.text = cellLayout?.model?.publishtime
            
        }
    }
}
