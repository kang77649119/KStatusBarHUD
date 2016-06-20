//
//  ViewController.swift
//  KStatusBarHUDExample
//
//  Created by 也许、 on 16/6/20.
//  Copyright © 2016年 K. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    @IBAction func success(sender: UIButton) {
        KStatusBarHUD.showSuccess("成功")
    }
    
    @IBAction func error(sender: UIButton) {
        KStatusBarHUD.showError("失败")
    }
    
    @IBAction func showMsg(sender: UIButton) {
        KStatusBarHUD.showMessage("不含图片的提示信息")
    }
    
    @IBAction func loading(sender: UIButton) {
        KStatusBarHUD.showLoading("处理中")
    }
    
    @IBAction func hide(sender: UIButton) {
        KStatusBarHUD.hide()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

