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
        
        let path = Bundle.main.path(forResource: "MainViewController.json", ofType: nil)
        if let jsonPath = path {
            let url = URL(fileURLWithPath: jsonPath)
            do{
                let data: Data = try Data(contentsOf: url as URL)
                let dicArr = try JSONSerialization.jsonObject(with: data, options: JSONSerialization.ReadingOptions.mutableContainers)
                
                for dic in dicArr as! [[String:String]]{
                    addChildViewController(childControllerName:dic["vcName"]!,
                                           title: dic["title"]!,
                                           imageName: dic["imageName"]!
                    )
                }
                
                print(dicArr)
            }
            catch{
                print("出错了 \(error)")
                addChildViewController(childControllerName:"HomeTableViewController",title: "首页",imageName: "tabbar_home")
                addChildViewController(childControllerName: "MessageTableViewController",title: "消息",imageName: "tabbar_message_center")
                addChildViewController(childControllerName: "NullViewController",title: "",imageName: "")
                addChildViewController(childControllerName: "DiscoveryTableViewController",title: "广场",imageName: "tabbar_discover")
                addChildViewController(childControllerName: "ProfileTableViewController",title: "我",imageName: "tabbar_profile")
            }
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setUpComposeBtn()
    }
    
    func composeBtnClick(){
        print(#function)
    }
    
    private func setUpComposeBtn(){
        
        tabBar.addSubview(composeBtn)
        let width = UIScreen.main.bounds.width / CGFloat(viewControllers!.count)
        
        let recet = CGRect(x: 2 * width, y: 0, width: width, height: 49)
        
        composeBtn.frame = recet
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
        let clsName = nameSpace.appending(".").appending(childControllerName)
        let cls:AnyClass? = NSClassFromString(clsName)
        
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
    
    private lazy var composeBtn:UIButton = {
       
        let btn = UIButton()
        btn.setImage(UIImage(named: "tabbar_compose_icon_add"),for: UIControlState.normal)
        btn.setImage(UIImage(named: "tabbar_compose_icon_add_highlighted"),for: UIControlState.selected)
        btn.setBackgroundImage(UIImage(named: "tabbar_compose_button"),for: UIControlState.normal)
        btn.setBackgroundImage(UIImage(named: "tabbar_compose_button_highlighted"),for: UIControlState.normal)

        btn.addTarget(self, action: "composeBtnClick", for: UIControlEvents.touchUpInside)
        
        return btn
    }()
    
}
        
