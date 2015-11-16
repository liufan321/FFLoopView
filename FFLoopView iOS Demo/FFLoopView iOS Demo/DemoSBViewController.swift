//
//  DemoSBViewController.swift
//  FFLoopView iOS Demo
//
//  Created by 刘凡 on 15/11/15.
//  Copyright © 2015年 joyios. All rights reserved.
//

import UIKit
import FFLoopView

class DemoSBViewController: UIViewController {
    
    @IBOutlet weak var loopView1: LoopView!
    @IBOutlet weak var loopView2: LoopView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 创建数据数组
        var urls = [NSURL]()
        var tips = [String]()
        for i in 1...5 {
            let fileName = String(format: "%02d.jpg", i)
            urls.append(NSBundle.mainBundle().URLForResource(fileName, withExtension: nil)!)
            
            tips.append("提示信息 --- \(i)")
        }
        
        loopView1.tipViewPosition = .Split
        loopView1.tipView.backgroundColor = UIColor.brownColor()
        loopView1.tipLabel.font = UIFont.systemFontOfSize(18)
        loopView1.showImages(urls, tips: tips)
        
        loopView2.showImages(urls, tips: tips)
    }
    
    override func willRotateToInterfaceOrientation(toInterfaceOrientation: UIInterfaceOrientation, duration: NSTimeInterval) {
        
        loopView1.relayoutView()
        loopView2.relayoutView()
    }
}
