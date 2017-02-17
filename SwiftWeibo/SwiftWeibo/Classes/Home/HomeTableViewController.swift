//
//  HomeTableViewController.swift
//  SwiftWeibo
//
//  Created by GenLi on 2/10/17.
//  Copyright © 2017 GenLi. All rights reserved.
//

import UIKit

class HomeTableViewController: BaseTableViewController {
    
    var vc:UIViewController?
    
    override init(style: UITableViewStyle) {
        super.init(style: style)
        let sb = UIStoryboard(name: "PopoverViewController", bundle: nil)
        vc = sb.instantiateInitialViewController()
        
        vc?.transitioningDelegate = self
        vc?.modalPresentationStyle = UIModalPresentationStyle.custom
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
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
        present(vc!, animated: true, completion: nil)
        
    }
    
    var isPresent: Bool = false
    
}

extension HomeTableViewController:UIViewControllerTransitioningDelegate,UIViewControllerAnimatedTransitioning
{
    
    func presentationController(forPresented presented: UIViewController, presenting: UIViewController?, source: UIViewController) -> UIPresentationController?{
        
        return PopoverPresentationController(presentedViewController: presented, presenting: presenting)
    }
    
    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning?{
        isPresent = true
        return self
    }
    
    
    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning?{
        isPresent = false
        return self
    }
    
    public func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval{
        return 0.5
    }
    
    // This method can only  be a nop if the transition is interactive and not a percentDriven interactive transition.
    public func animateTransition(using transitionContext: UIViewControllerContextTransitioning){
        
        
        if isPresent {
            //startPresentAnimation()
            let toView = transitionContext.view(forKey: UITransitionContextViewKey.to)
            toView?.transform = CGAffineTransform(scaleX: 1.0, y: 0.0)
            
            transitionContext.containerView.addSubview(toView!)
            
            toView?.layer.anchorPoint = CGPoint(x: 0.5, y: 0)
            UIView.animate(withDuration: 0.5, animations: { () -> Void in
                toView?.transform = CGAffineTransform.identity
            },completion : {
                (Bool)->Void in
                transitionContext.completeTransition(true)
            })
        }else{
            //startdismissAnimation()
            let fromView = transitionContext.view(forKey: UITransitionContextViewKey.from)
            
            
            transitionContext.containerView.addSubview(fromView!)
            
            fromView?.layer.anchorPoint = CGPoint(x: 0.5, y: 0)
            UIView.animate(withDuration: 0.5, animations: { () -> Void in
                // 3.2还原动画
                fromView?.transform = CGAffineTransform(scaleX: 1.0, y: 0.00000001)
                
            },completion : {
                (Bool)->Void in
                transitionContext.completeTransition(true)
            })
            
        }
        
        
    }
    
    
    
}











