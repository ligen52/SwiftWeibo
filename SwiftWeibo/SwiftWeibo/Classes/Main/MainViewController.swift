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
        addChildViewController(childController: HomeTableViewController(),title: "首页",imageName: "tabbar_home")
        addChildViewController(childController: MessageTableViewController(),title: "消息",imageName: "tabbar_message_center")
        addChildViewController(childController: DiscoverTableViewController(),title: "广场",imageName: "tabbar_discover")
        addChildViewController(childController: ProfileTableViewController(),title: "我",imageName: "tabbar_profile")
        
    }
    
    private func addChildViewController(childController: UIViewController,title:String,imageName:String) {

        //1.1 home icon
        childController.tabBarItem.image = UIImage(named: imageName)
        childController.tabBarItem.selectedImage = UIImage(named: imageName + "_highlighted")
        
        //1.2 nav bar
        childController.title = title
        
        let nav = UINavigationController()
        nav.addChildViewController(childController)
        
        addChildViewController(nav)
        
    }

}
        
