//
//  HttpTool.swift
//  alamofireTest
//
//  Created by Shenguang on 17/6/19.
//  Copyright © 2017年 Shenguang. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class HttpTool{
    
    /// 创建单例
    static let shareInstance : HttpTool = HttpTool()
    
}

//MARK: - 网络请求封装
extension HttpTool {

    func jsonRequest( urlString : String , method: HTTPMethod, params : [String : Any]? , success : @escaping (_ responseJSON : JSON )->(), failture : @escaping (_ error : Error)->()) {
        
        
        Alamofire.request(urlString, method: method, parameters: params, encoding: URLEncoding.default).validate().responseJSON
            {response in
                switch response.result {
                case.success(let value):
                    let json = JSON(value)
                    success(json)
                case .failure(let error):
                    failture(error)
                }
        }
    }
}
