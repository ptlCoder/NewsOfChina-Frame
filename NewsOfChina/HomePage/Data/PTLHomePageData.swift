//
//  PTLHomePageData.swift
//  NewsOfChina
//
//  Created by Roc on 2018/8/24.
//  Copyright © 2018年 ptlCoder. All rights reserved.
//

import UIKit

// 默认页码
var pages: Int = 0
// 每次请求个数
let count: Int = 20


class PTLHomePageData {

    class func requstData(_ isLoadingNewData: Bool? = true, successCompletion:@escaping (_ result: [String: Any])->(), failureCompletion:@escaping (_ result: Error)->()) {

        
        if isLoadingNewData! {
            pages = 0
        }else {
            pages = pages + 1
        }
        
        let urlStr = "http://v5.chinapeace.gov.cn/app_if/getArticles?columnId=7&lastFileId=0&count=\(count)&rowNumber=\(pages*count)&version=0&adv=1"
        
        PTLNetworkTools.requestDate(urlStr, method: .get, parameters: nil, successCompletion: { (result) in
            
            if successCompletion != nil {
                successCompletion (result)
            }

        })  { (error) in
            
            
            if failureCompletion != nil {
                failureCompletion (error)
            }
            
        }
    }
}
