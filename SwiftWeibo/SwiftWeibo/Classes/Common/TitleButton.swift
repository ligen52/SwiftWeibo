//
//  TitleButton.swift
//  SwiftWeibo
//
//  Created by GenLi on 2/15/17.
//  Copyright © 2017 GenLi. All rights reserved.
//

import UIKit

class TitleButton: UIButton {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setTitleColor(UIColor.darkGray, for: UIControlState.normal)
        self.setImage(UIImage(named: "navigationbar_arrow_up"), for: UIControlState.normal)
        self.setImage(UIImage(named: "navigationbar_arrow_down"), for: UIControlState.selected)
        self.sizeToFit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        titleLabel?.frame.origin.x = 0
        imageView?.frame.origin.x = titleLabel!.bounds.width
        
    }
    
}
