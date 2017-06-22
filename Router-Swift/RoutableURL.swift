//
//  RoutableURL.swift
//  Router-Swift
//
//  Created by Niko on 2017/6/21.
//  Copyright © 2017年 Niko. All rights reserved.
//

import Foundation


// MARK: - 默认对URL扩展支持的实现，
extension URL: Routable {
    
    var routeScheme: String {
        return "Router"
    }
    
    /// 启动参数，默认按照URL的Query参数取，不支持嵌套
    var lauchParams: [String : Any]? {
        if let kvarr = self.query?.components(separatedBy: "&") {
            var dic = [String : Any]()
            for (_ , value) in kvarr.enumerated() {
                if value.contains("=") {
                    let arr: [String] = value.components(separatedBy: "=")
                    dic.updateValue(arr[1], forKey: arr[0])
                }
            }
            return dic
        }
        return nil
        
    }
    
    /// 取Scheme当签名去寻找对应的Node
    var nodeType: RouteNodeConvertible.Type? {
        if routable {
            if let host = self.host {
                return URLRouteMap.default.getNodeType(host)
            }
        }
        return nil
    }
    
    var routable: Bool {
        if let scheme = self.scheme {
            if scheme == routeScheme {
                return true
            }
        }
        return false
    }
    
}

