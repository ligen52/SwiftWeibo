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
        
        let titleBtn = TitleButton()
        titleBtn.setTitle("mars ", for: UIControlState.normal)
        titleBtn.addTarget(self, action: #selector(titleBtnClick), for: UIControlEvents.touchUpInside)
        navigationItem.titleView = titleBtn
        
    }
    
    func titleBtnClick(btn:UIButton){
        btn.isSelected = !btn.isSelected
        let sb = UIStoryboard(name: "PopoverViewController", bundle: nil)
        let vc = sb.instantiateInitialViewController()
        
        vc?.transitioningDelegate = self
        vc?.modalPresentationStyle = UIModalPresentationStyle.custom
        
        present(vc!, animated: false, completion: nil)
        
    }
    
}

extension HomeTableViewController:UIViewControllerTransitioningDelegate{
    func presentationController(forPresented presented: UIViewController, presenting: UIViewController?, source: UIViewController) -> UIPresentationController?{
        print(#function)
        return PopoverPresentationController(presentedViewController: presented, presenting: presenting)
    }
}











