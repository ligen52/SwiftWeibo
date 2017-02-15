//
//  BaseTableViewController.swift
//  SwiftWeibo
//
//  Created by GenLi on 2/13/17.
//  Copyright © 2017 GenLi. All rights reserved.
//

import UIKit

class BaseTableViewController: UITableViewController, VisitorViewDelegate {
    
    var isUserLogin = true
    var visitorView:VisitorView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func loadView() {
        isUserLogin ? super.loadView() : loadVisitorView()
    }
    
    private func loadVisitorView(){
        visitorView = VisitorView.newInstance()
        view = visitorView
        
        visitorView?.delegate = self
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "注册", style: UIBarButtonItemStyle.plain, target: self, action: #selector(BaseTableViewController.registerBtnWillClick))
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "登录", style: UIBarButtonItemStyle.plain, target: self, action: #selector(BaseTableViewController.loginBtnWillClick))
    }
    
    func loginBtnWillClick() {
        print(#function)
    }
    
    func registerBtnWillClick() {
        print(#function)
    }
    
    
}
