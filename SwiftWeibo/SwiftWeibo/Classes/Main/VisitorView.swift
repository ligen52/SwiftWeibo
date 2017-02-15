//
//  VisitorView.swift
//  SwiftWeibo
//
//  Created by GenLi on 2/13/17.
//  Copyright © 2017 GenLi. All rights reserved.
//

import UIKit

protocol VisitorViewDelegate:NSObjectProtocol {
    
    func registerBtnWillClick()
    
    func loginBtnWillClick()
    
}

class VisitorView: UIView {

    @IBOutlet weak var message: UILabel!
    
    @IBOutlet weak var registerBtn: UIButton!
    
    @IBOutlet weak var loginBtn: UIButton!
    
    @IBOutlet weak var icon: UIImageView!
    
    @IBOutlet weak var bgIcon: UIImageView!
    
    weak var delegate:VisitorViewDelegate?
    
    static func newInstance() -> VisitorView?{
        let nibView = Bundle.main.loadNibNamed("VisitorView", owner: nil, options: nil)
        if let view = nibView!.first as? VisitorView{
            return view
        }
        return nil
    }
    
    
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    func registerBtnClick(){
        delegate?.registerBtnWillClick()
    }
    
    func loginBtnClick(){
        delegate?.loginBtnWillClick()
    }
    
    func setupVisitorViewInfo(isHome:Bool,imgName:String,msg:String){
        if !isHome {
            bgIcon.isHidden = true
        }else{
            startAnimation()
        }
        icon.image = UIImage(named: imgName)
        message.text = msg
        
        registerBtn.addTarget(self, action: #selector(VisitorView.registerBtnClick), for: UIControlEvents.touchUpInside)
        loginBtn.addTarget(self, action: #selector(VisitorView.loginBtnClick), for: UIControlEvents.touchUpInside)
    }
    
    private func startAnimation(){
        let anim = CABasicAnimation(keyPath: "transform.rotation")
        anim.toValue = 2 * M_PI
        anim.duration = 20
        anim.isRemovedOnCompletion = false
        anim.repeatCount = MAXFLOAT
        
        bgIcon.layer.add(anim, forKey: nil)
    }

}
