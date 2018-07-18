//
//  PTLHomePageModel.swift
//  NewsOfChina
//
//  Created by soliloquy on 2018/6/24.
//  Copyright © 2018年 soliloquy. All rights reserved.
//

import UIKit

@objc(PTLHomePageModel)
// Swift 4.1 属性要加 @objc
class PTLHomePageModel: NSObject {
    
    @objc var bigPic:Int = 0
    @objc var picMiddle:String? = ""
    @objc var contentUrl:String? = ""
    @objc var attAbstract:String? = "" // 描述
    @objc var urlPad:String? = ""
    @objc var title:String? = "" // 标题
    @objc var shareUrl:String? = ""
    @objc var countPraise:Int = 0
    @objc var publishtime:String? = ""
    @objc var countShare:Int = 0
    @objc var countClick:Int = 0
    @objc var colID:Int = 0

}
