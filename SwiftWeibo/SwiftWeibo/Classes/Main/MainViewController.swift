//
//  MainViewController.swift
//  SwiftWeibo
//
//  Created by GenLi on 2/10/17.
//  Copyright © 2017 GenLi. All rights reserved.
//

import UIKit

class MainViewController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        tabBar.tintColor = UIColor.orange
        //home page
        //        addChildViewController(childController: HomeTableViewController(),title: "首页",imageName: "tabbar_home")
        //        addChildViewController(childController: MessageTableViewController(),title: "消息",imageName: "tabbar_message_center")
        //        addChildViewController(childController: DiscoverTableViewController(),title: "广场",imageName: "tabbar_discover")
        //        addChildViewController(childController: ProfileTableViewController(),title: "我",imageName: "tabbar_profile")
        addChildViewController(childControllerName:"HomeTableViewController",title: "首页",imageName: "tabbar_home")
        addChildViewController(childControllerName: "MessageTableViewController",title: "消息",imageName: "tabbar_message_center")
        addChildViewController(childControllerName: "DiscoverTableViewController",title: "广场",imageName: "tabbar_discover")
        addChildViewController(childControllerName: "ProfileTableViewController",title: "我",imageName: "tabbar_profile")
    }
    
    private func addChildViewController(childController: UIViewController,title:String,imageName:String) {
        
        let nav = UINavigationController()
        
        //1.1 home icon
        childController.tabBarItem.image = UIImage(named: imageName)
        childController.tabBarItem.selectedImage = UIImage(named: imageName + "_highlighted")
        
        //1.2 nav bar
        childController.title = title
        
        nav.addChildViewController(childController)
        
        addChildViewController(nav)
        
    }
    
    private func addChildViewController(childControllerName: String,title:String,imageName:String) {
        
        let nav = UINavigationController()
        let nameSpace = Bundle.main.infoDictionary!["CFBundleExecutable"] as! String
        let cls:AnyClass? = NSClassFromString(nameSpace.appending(".").appending(childControllerName))
        
        let vcCls = cls as! UIViewController.Type
        let childController = vcCls.init()
        
        //1.1 home icon
        childController.tabBarItem.image = UIImage(named: imageName)
        childController.tabBarItem.selectedImage = UIImage(named: imageName + "_highlighted")
        
        //1.2 nav bar
        childController.title = title
        
        nav.addChildViewController(childController)
        
        addChildViewController(nav)
        
    }
    
}
        
