//
//  URLRouteMap.swift
//  Router-Swift
//
//  Created by Niko on 2017/6/16.
//  Copyright © 2017年 Niko. All rights reserved.
//

import UIKit


/// 默认提供的URL映射表，数据放在内存中，可扩展实现远程更新映射表
struct URLRouteMap : RouteNodeMap {
    
    public static var `default`: URLRouteMap {
        return URLRouteMap()
    }
    
    private let vcmap: [String: RouteNodeConvertible.Type] = [
        "test": TestViewController.self
    ]
    
    func getNodeType(_ sign: String) -> RouteNodeConvertible.Type? {
        return vcmap[sign]
    }
}
