//
//  PTLHomePageCellLayout.swift
//  NewsOfChina
//
//  Created by Roc on 2018/6/27.
//  Copyright © 2018年 soliloquy. All rights reserved.
//

import UIKit
import CoreGraphics

class PTLHomePageCellLayout: NSObject {
    
    var model: PTLHomePageModel?
    var titleLabelRect: CGRect!
    var attAbstractLabelRect: CGRect!
    var bigPicImageViewRect: CGRect!
    var timeLabelRect: CGRect!
    var cellHeight: CGFloat = 0.0
    
    
    init(_ model: PTLHomePageModel) {

        self.model = model
        
        let margin: CGFloat = 5;
        let titleX: CGFloat = 8
        let titleY: CGFloat = 8
        let titleW = kScreenWidth - titleX*2
        let titleH = (model.title! as NSString).textSize(with: UIFont.systemFont(ofSize: 25), numberOfLines: 0, constrainedWidth: titleW).height
        self.titleLabelRect = CGRect(x: titleX, y: titleY, width: titleW, height: titleH)
        
        
        let picX = titleX
        let picY = titleLabelRect.maxY + margin
        let picW = titleW
        let picH: CGFloat = 230
        self.bigPicImageViewRect = CGRect(x: picX, y: picY, width: picW, height: picH)
        
        
        let attAX = titleX
        let attAY = bigPicImageViewRect.maxY + margin
        let attAW = titleW
        let attAH = (model.attAbstract! as NSString).textSize(with: UIFont.systemFont(ofSize: 15), numberOfLines: 0, constrainedWidth: attAW).height
        self.attAbstractLabelRect = CGRect(x: attAX, y: attAY, width: attAW, height: attAH)
        
        let timeX = titleX
        let timeY = attAbstractLabelRect.maxY + margin
        let timeW = titleW
        let timeH = (model.publishtime! as NSString).textSize(with: UIFont.systemFont(ofSize: 15), numberOfLines: 0, constrainedWidth: timeW).height
        self.timeLabelRect = CGRect(x: timeX, y: timeY, width: timeW, height: timeH)
        
        cellHeight = timeLabelRect.maxY + margin
        super.init()
    }
    
}
