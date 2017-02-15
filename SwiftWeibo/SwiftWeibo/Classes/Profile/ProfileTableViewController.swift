
//
//  ProfileTableViewController.swift
//  SwiftWeibo
//
//  Created by GenLi on 2/10/17.
//  Copyright © 2017 GenLi. All rights reserved.
//

import UIKit

class ProfileTableViewController: BaseTableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        if !isUserLogin {
            visitorView?.setupVisitorViewInfo(isHome: false, imgName: "visitordiscover_image_message", msg: "登录后,你的微博,相册,个人资料会显示在这里")
            return
        }
    }
}
