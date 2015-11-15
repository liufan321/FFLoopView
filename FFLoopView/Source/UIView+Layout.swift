//
//  UIView+Layout.swift
//  FFLoopView
//
//  Created by 刘凡 on 15/11/16.
//  Copyright © 2015年 joyios. All rights reserved.
//

import UIKit

extension UIView {
    
    /// 取消所有子视图的 autoresizing 属性
    func disableSubviewsAutoresizing() {
        for v in subviews {
            v.translatesAutoresizingMaskIntoConstraints = false
        }
    }
}

extension NSLayoutConstraint {
    
    /// 建立约束数组
    ///
    /// - parameter formats: VLF 数组
    /// - parameter metrics: metrics 字典
    /// - parameter views:   views 字典
    ///
    /// - returns: 约束数组
    class func constraints(formats: [String], metrics: [String: AnyObject]?, views: [String: AnyObject]) -> [NSLayoutConstraint] {
        
        var cons = [NSLayoutConstraint]()
        
        for format in formats {
            cons += NSLayoutConstraint.constraintsWithVisualFormat(format, options: [], metrics: metrics, views: views)
        }
        
        return cons
    }
}

