//
//  KStatusBarHUD.swift
//  KStatusBarHUD
//
//  Created by 也许、 on 16/6/20.
//  Copyright © 2016年 K. All rights reserved.
//

import UIKit

class KStatusBarHUD: NSObject {
    
    static let duration:Double = 2
    
    static let animateDuration = 0.25
    
    static let MessageFont = UIFont.systemFontOfSize(12)
    
    static var window:UIWindow!
    
    static var timer:NSTimer?
    
    /**
        显示窗口
     */
    class func showWindow() {
        
        // 设置窗口尺寸
        var frame = CGRectMake( 0, -20, UIScreen.mainScreen().bounds.width, 20)
        window = UIWindow(frame: frame)
        window.windowLevel = UIWindowLevelAlert // 设置等级 alert为最高 不会被其他视图遮挡
        window.backgroundColor = UIColor.blackColor()
        window.hidden = false
        
        frame.origin.y = 0
        UIView.animateWithDuration(animateDuration) { 
            window.frame = frame
        }
        
    }
    
    /**
        显示成功信息
     */
    class func showSuccess(msg:String) {
        showMessage(msg, image: UIImage(named: "KStatusBarHUD.bundle/success"))
    }
    
    /**
        显示失败信息
     */
    class func showError(msg:String) {
        showMessage(msg, image: UIImage(named: "KStatusBarHUD.bundle/error"))
    }
    
    /**
        显示正在处理
        因为要显示指示器(菊花),所以这里要重新创建显示文字控件等,没有使用showMessage方法
     */
    class func showLoading(msg:String) {
        
        // 取消上次的定时
        self.timer?.invalidate()
        self.timer = nil
        
        showWindow()
        
        // 创建显示文字的控件
        let msgLabel = UILabel(frame: self.window.frame)
        msgLabel.font = MessageFont
        msgLabel.text = msg
        msgLabel.textColor = UIColor.whiteColor()
        msgLabel.textAlignment = .Center
        self.window.addSubview(msgLabel)
        
        // 创建指示器
        let activityX = (self.window.bounds.width - NSString(string: msg).sizeWithAttributes([ NSFontAttributeName : MessageFont ]).width ) * 0.5 - 20
        let activityY = self.window.bounds.height * 0.5
        
        let activityView = UIActivityIndicatorView(activityIndicatorStyle: .White)
        activityView.center = CGPointMake(activityX, activityY)
        activityView.startAnimating()
        self.window.addSubview(activityView)
        
    }
    
    /**
        显示文字
     */
    class func showMessage(msg:String) {
        showMessage(msg, image: nil)
    }
    
    /**
        显示提示
     - parameter msg:   文字
     - parameter image: 图片
     */
    class func showMessage(msg:String,image:UIImage?) {
    
        // 取消上次的定时器
        timer?.invalidate()
        timer = nil
        
        self.showWindow()
        
        // 设置定时器
        timer = NSTimer.scheduledTimerWithTimeInterval(duration, target: self, selector: #selector(KStatusBarHUD.hide), userInfo: nil, repeats: false)
        
        // 添加按钮 (显示图片和文字)
        let btn = UIButton(type: .Custom)
        btn.frame = window.frame
        btn.setTitle(msg, forState: .Normal)
        btn.titleLabel?.font = MessageFont
        window.addSubview(btn)
        
        guard let _ = image else {
            return
        }
        
        btn.setImage(image, forState: .Normal)
        btn.titleEdgeInsets = UIEdgeInsetsMake(0, 10, 0, 0)
       
    }
    
    /**
        隐藏
     */
    class func hide() {
        
        UIView.animateWithDuration(animateDuration, animations: {
            window.frame.origin.y = -20
        }) { (flag) in
            self.window = nil
            timer?.invalidate()
            timer = nil
        }
        
    }

}
