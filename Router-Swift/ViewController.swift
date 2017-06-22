//
//  ViewController.swift
//  Router-Swift
//
//  Created by Niko on 2017/6/22.
//  Copyright © 2017年 Niko. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
        
    }

    @IBAction func openNext(_ sender: Any) {
        let style = Router.Style.present(by: self, animated: true)
//        let vc = TestViewController()
//        Router.default.open(vc, style: style)
        
        if let url = URL.init(string: "Router://test?label=abc") {
             Router.default.open(url, style: style)
        }
    }

}

