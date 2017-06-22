//
//  TestViewController.swift
//  Router-Swift
//
//  Created by Niko on 2017/6/22.
//  Copyright © 2017年 Niko. All rights reserved.
//

import UIKit

class TestViewController: UIViewController, RouteNodeConvertible {

    @IBOutlet weak var label: UILabel!
    
    // 启动参数
    var lauchData: [String: Any]?
    /// 启动方法
    required convenience init(launchParams data: [String: Any]?) {
        self.init()
        lauchData = data
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        if let text = lauchData?["label"]{
            label.text = text as? String
        }
        
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
