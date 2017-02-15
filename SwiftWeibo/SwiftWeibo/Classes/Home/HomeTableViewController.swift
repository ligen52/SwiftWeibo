//
//  HomeTableViewController.swift
//  SwiftWeibo
//
//  Created by GenLi on 2/10/17.
//  Copyright © 2017 GenLi. All rights reserved.
//

import UIKit

class HomeTableViewController: BaseTableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        if !isUserLogin {
            visitorView?.setupVisitorViewInfo(isHome: true, imgName: "visitordiscover_feed_image_house", msg: "关注一些人,回这里看有些什么惊喜")
            return
        }
        
        setupNav()
    }

    private func setupNav(){
        navigationItem.leftBarButtonItem = UIBarButtonItem.createBarButton(imageName: "navigationbar_friendattention")
        
        navigationItem.rightBarButtonItem = UIBarButtonItem.createBarButton(imageName: "navigationbar_pop")
    }
    
}
