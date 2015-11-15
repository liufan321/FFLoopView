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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        prepareLoopView()
    }
    
    private func prepareLoopView() {
        let loopView = FFLoopView()
        view.addSubview(loopView)
        
        for v in view.subviews {
            v.translatesAutoresizingMaskIntoConstraints = false
        }
        
        let viewDictionary: [String : AnyObject] = ["loopView": loopView, "topLayoutGuide": topLayoutGuide]
        view.addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("H:|-0-[loopView]-0-|",
            options: [],
            metrics: nil,
            views: viewDictionary))
        view.addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("V:|-0-[topLayoutGuide]-0-[loopView(120)]",
            options: [],
            metrics: nil,
            views: viewDictionary))
        
        loopView.backgroundColor = UIColor.redColor()
    }
}
