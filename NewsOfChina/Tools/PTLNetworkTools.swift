//
//  PTLNetworking.swift
//  NewsOfChina
//
//  Created by soliloquy on 2018/6/24.
//  Copyright © 2018年 soliloquy. All rights reserved.
//

import UIKit
import Alamofire
import MBProgressHUD

public enum Method: String {
    case get     = "GET"
    case post    = "POST"
    case put     = "PUT"
    case delete  = "DELETE"
}

class PTLNetworkTools: NSObject {

    class func requestDate(_ urlStr: String? = "", method: Method, parameters:[String: Any]? = nil, successCompletion:@escaping (_ result: [String: Any])->(), failureCompletion:@escaping (_ result: Error)->()) {

        print("✈️✈️✈️✈️ urlStr: \(urlStr ?? "")\n ✈️✈️✈️ params: \(String(describing: parameters))")
        
        let mb = MBProgressHUD.showAdded(to: UIApplication.shared.keyWindow!, animated: true)
        mb.label.text = "加载中..."

        let m: HTTPMethod = (method == Method.get) ? .get : .post
        Alamofire.request(urlStr!, method: m, parameters: parameters, encoding: JSONEncoding.default)
            .validate { request, response, data in
                return .success
            }
            .responseJSON { response in
                
                if response.result.isSuccess {
                    mb.hide(animated: true)
                    successCompletion(response.result.value as! [String: Any])
                }else {
                    mb.label.text = "加载失败"
                    mb.mode = .text
                    mb.hide(animated: true, afterDelay: 2)
                    failureCompletion(response.result.error!)
                }
        }
        
    }
    
}
