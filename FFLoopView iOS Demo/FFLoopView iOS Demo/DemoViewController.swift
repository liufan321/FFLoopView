//
//  DemoViewController.swift
//  FFLoopView iOS Demo
//
//  Created by 刘凡 on 15/11/15.
//  Copyright © 2015年 joyios. All rights reserved.
//

import UIKit
import FFLoopView

class DemoViewController: UIViewController {
    
    private var loopView: LoopView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        prepareLoopView()
    }
    
    private func prepareLoopView() {
        
        // 1. 添加控件
        loopView = LoopView()
        view.addSubview(loopView!)
        
        // 2. 自动布局
        for v in view.subviews {
            v.translatesAutoresizingMaskIntoConstraints = false
        }
        
        let views: [String : AnyObject] = ["loopView": loopView!, "topLayoutGuide": topLayoutGuide]
        view.addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("H:|-0-[loopView]-0-|",
            options: [],
            metrics: nil,
            views: views))
        view.addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("V:|-0-[topLayoutGuide]-0-[loopView(160)]",
            options: [],
            metrics: nil,
            views: views))
        
        // 3. 创建数据数组
        var urls = [NSURL]()
        var tips = [String]()
        for i in 1...5 {
            let fileName = String(format: "%02d.jpg", i)
            urls.append(NSBundle.mainBundle().URLForResource(fileName, withExtension: nil)!)
            
            tips.append("提示信息 --- \(i)")
        }

        loopView?.showImages(urls, tips: tips) { [weak self] index in
            print("选中了第 \(index) 张图像 \(self?.view)")
        }
    }
    
    override func willRotateToInterfaceOrientation(toInterfaceOrientation: UIInterfaceOrientation, duration: NSTimeInterval) {
        
        loopView?.relayoutView()
    }
    
    @IBAction func removeLoopView() {
        loopView?.removeFromSuperview()
        loopView?.stopTimer()
        
        loopView = nil
    }
}
