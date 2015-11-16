//
//  PagingView.swift
//  FFLoopView
//
//  Created by 刘凡 on 15/11/16.
//  Copyright © 2015年 joyios. All rights reserved.
//

import UIKit

/// 分页视图类型
///
/// - Text:     文本，适合任意个数的分页显示
/// - SmallDot: 小点，适合 5 个以内的分页显示
/// - Clock:    时钟，适合 4~12 个左右的分页显示
public enum FFPagingViewType: Int {
    case Text
    case SmallDot
    case Clock
}

/// 分页视图
public class PagingView: UIView {

    // MARK: 公共属性
    /// 分页视图类型
    public var pagingType: FFPagingViewType = .Text
    
    /// 总页数
    public var numberOfPages: Int = 0 {
        didSet {
            pageLabel.text = "\(numberOfPages)"
            
            hiddenLabels()
        }
    }
    /// 当前页数
    public var currentPage: Int = 0  {
        didSet {
            
            switch pagingType {
            case .SmallDot, .Clock: setNeedsDisplay()
            case .Text:
                currentPageLabel.text = "\(currentPage + 1)"
            }
            
            hiddenLabels()
        }
    }
    /// 单页时隐藏
    public var hidesForSinglePage: Bool = true
    
    /// 其他页号标示颜色
    public var pageIndicatorTintColor: UIColor?
    /// 当前页标示颜色
    public var currentPageIndicatorTintColor: UIColor?
    
    // MARK: 公共函数
    /// 设置外观
    ///
    /// - parameter labelFont:    分页标签字体
    /// - parameter labelColor:   分页标签颜色
    /// - parameter currentFont:  当前分页标签字体
    /// - parameter currentColor: 当前分页标签颜色
    public func setupAppearance(labelFont: UIFont, labelColor: UIColor, currentFont: UIFont, currentColor: UIColor) {

        pageLabel.font = labelFont
        sepLabel.font = labelFont
        currentPageLabel.font = currentFont
        
        pageLabel.textColor = labelColor
        sepLabel.textColor = labelColor
        currentPageLabel.textColor = currentColor
        
        pageLabel.sizeToFit()
        sepLabel.sizeToFit()
        currentPageLabel.sizeToFit()
    }
    
    // MARK: 构造函数
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        prepareUI()
    }

    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: 私有控件
    /// 总页数标签
    private lazy var pageLabel = UILabel()
    /// 当前页标签
    private lazy var currentPageLabel = UILabel()
    /// 分割线标签
    private lazy var sepLabel = UILabel()
}

// MARK: - 设置视图
private extension PagingView {
    
    /// 隐藏标签
    private func hiddenLabels() {
        let isShow = (pagingType == .Text) && numberOfPages > 1 && hidesForSinglePage
        
        pageLabel.hidden = !isShow
        currentPageLabel.hidden = !isShow
        sepLabel.hidden = !isShow
    }
    
    /// 准备界面
    private func prepareUI() {
        backgroundColor = UIColor.clearColor()
        
        currentPageLabel.text = "10"
        sepLabel.text = "/"
        pageLabel.text = "99"
        
        addSubview(currentPageLabel)
        addSubview(sepLabel)
        addSubview(pageLabel)
        
        setupAppearance(UIFont.systemFontOfSize(10),
            labelColor: UIColor.whiteColor(),
            currentFont: UIFont.systemFontOfSize(14),
            currentColor: UIColor.yellowColor())
        
        disableSubviewsAutoresizing()
        
        addConstraint(NSLayoutConstraint(item: sepLabel,
            attribute: .CenterX,
            relatedBy: .Equal,
            toItem: self,
            attribute: .CenterX,
            multiplier: 1.0,
            constant: 0.0))
        addConstraint(NSLayoutConstraint(item: currentPageLabel,
            attribute: .Right,
            relatedBy: .Equal,
            toItem: sepLabel,
            attribute: .Left,
            multiplier: 1.0,
            constant: 0.0))
        addConstraint(NSLayoutConstraint(item: pageLabel,
            attribute: .Left,
            relatedBy: .Equal,
            toItem: sepLabel,
            attribute: .Right,
            multiplier: 1.0,
            constant: 0.0))
        
        addConstraint(NSLayoutConstraint(item: sepLabel,
            attribute: .CenterY,
            relatedBy: .Equal,
            toItem: self,
            attribute: .CenterY,
            multiplier: 1.0,
            constant: 0.0))
        addConstraint(NSLayoutConstraint(item: currentPageLabel,
            attribute: .Baseline,
            relatedBy: .Equal,
            toItem: sepLabel,
            attribute: .Baseline,
            multiplier: 1.0,
            constant: 0.0))
        addConstraint(NSLayoutConstraint(item: pageLabel,
            attribute: .Baseline,
            relatedBy: .Equal,
            toItem: sepLabel,
            attribute: .Baseline,
            multiplier: 1.0,
            constant: 0.0))
    }
}