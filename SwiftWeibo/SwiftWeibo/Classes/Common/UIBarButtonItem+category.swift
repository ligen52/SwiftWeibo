//
//  UIBarButtonItem+category.swift
//  SwiftWeibo
//
//  Created by GenLi on 2/15/17.
//  Copyright © 2017 GenLi. All rights reserved.
//

import UIKit

extension UIBarButtonItem {
    
    class func createBarButton(imageName:String)->UIBarButtonItem{
    let leftBtn = UIButton()
    leftBtn.setImage(UIImage(named: imageName), for: UIControlState.normal)
    leftBtn.setImage(UIImage(named: imageName+"_highlighted"), for: UIControlState.highlighted)
    leftBtn.sizeToFit()
    return UIBarButtonItem(customView: leftBtn)
    }
}
