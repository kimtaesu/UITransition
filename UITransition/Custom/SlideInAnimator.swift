//
//  CustomPresentFadeAnimatedTransitioning.swift
//  UITransition
//
//  Created by tskim on 18/08/2019.
//  Copyright © 2019 hucet. All rights reserved.
//

import UIKit

final class SlideInAnimator: NSObject, UIViewControllerAnimatedTransitioning {
    
    func transitionDuration(using ctx: UIViewControllerContextTransitioning?) -> TimeInterval {
        return 1
    }
    
    func animateTransition(using ctx: UIViewControllerContextTransitioning) {
        print("animateTransition start")
        guard let fromVC = ctx.viewController(forKey: .from),
            let toVC = ctx.viewController(forKey: .to),
            let snapshot = fromVC.view.snapshotView(afterScreenUpdates: true)
            else {
                return
        }
        let containerView = ctx.containerView
        let initialFrame = ctx.initialFrame(for: fromVC)
        let finalFrame = ctx.finalFrame(for: toVC)
        snapshot.frame = initialFrame
        containerView.addSubview(toVC.view)
        containerView.addSubview(snapshot)
        toVC.view.frame = finalFrame
        toVC.view.frame.origin.x = finalFrame.width
        UIView.animate(
            withDuration: transitionDuration(using: ctx), animations: {
                snapshot.frame.origin.x = -finalFrame.width
                toVC.view.frame = finalFrame
        }) { _ in
            snapshot.removeFromSuperview()
            ctx.completeTransition(!ctx.transitionWasCancelled)
        }
    }
    
    func animationEnded(_ transitionCompleted: Bool) {
        print("ended")
    }
    
}
