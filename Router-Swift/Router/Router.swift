//
//  Router.swift
//  Router-Swift
//
//  Created by Niko on 2017/6/15.
//  Copyright © 2017年 Niko. All rights reserved.
//

import UIKit
import Foundation

/// 路由节点的映射协议，提供映射方法的对象需要遵循
protocol RouteNodeMap {
    /// 签名到节点类型的映射
    func getNodeType(_ sign: String) -> RouteNodeConvertible.Type?
}

/// 支持路由调度的界面需要遵循的协议
protocol RouteNodeConvertible {
    /// 启动参数
    var lauchData: [String: Any]? { get }
    /// 启动方法
    init(launchParams data: [String: Any]?)
}

/// Routable协议，所有支持Route解析的对象都必须遵循这个协议
protocol Routable {
    /// 路由节点的Class
    var nodeType: RouteNodeConvertible.Type? { get }
    /// 路由节点（ViewController）的启动参数
    var lauchParams: [String: Any]? { get }
    /// 是否能够找到对应的Node
    var routable: Bool { get }
}

/// 默认实现了routable方法
extension Routable {
    var routable: Bool {
        return (nodeType != nil) ? true : false
    }
}

struct Router {

    /// 默认的NavigationController,需要手动指定
    public static weak var defaultNavigationViewController: UINavigationController?
    
    public static var `default`: Router { return Router() }
    
    /// 打开界面的样式 push和present 只支持UIViewController
    enum Style {
        /// 自定义打开VC的方法
        typealias OpenAction = ( (RouteNodeConvertible) -> Void )
        /// Push
        case push(by: UINavigationController?, animated: Bool)
        /// Present
        case present(by: UIViewController, animated:  Bool)
        /// 自定义
        case custom(OpenAction)
    }
    

    /// - Parameters:
    ///   - obj: 实现了Routable协议的对象，比如RoutableURL
    ///   - style: 打开界面的方式，默认是push,需要事先为Router指定过NavigationController,
    public func open<T: Routable>(_ obj: T, style: Style = .push(by: Router.defaultNavigationViewController, animated: true)) {
        if let nType = obj.nodeType {
            let node = nType.init(launchParams: obj.lauchParams)
            open(node, style: style)
        } else {
            print("invalid route scheme")
        }
    }
    
    /// - Parameters:
    ///   - obj: 路由节点的实例对象
    ///   - style: 同上
    public func open(_ obj: RouteNodeConvertible, style: Style = .push(by: Router.defaultNavigationViewController!, animated: true)) {
        switch style {
        case .push(let nav, let animated):
            if let navc = nav {
                navc.pushViewController(obj as! UIViewController, animated: animated)
            } else {
                print("not found the nav")
            }
        case .present(let v, let animated):
            v.present(obj as! UIViewController, animated: animated, completion: nil)
        case .custom(let action):
            action(obj)
        }
    }

}



