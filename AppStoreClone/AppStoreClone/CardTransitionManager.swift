//
//  CardTransitionManager.swift
//  AppStoreClone
//
//  Created by Kaan Odabaş on 27.08.2023.
//

import UIKit

enum CardTransitionType {
    case presentation
    case dismissal
}

class CardTransitionManager: NSObject {
    
    let transitionDuration: Double = 0.8
    var transition: CardTransitionType = .presentation
    let shrinkDuration: Double = 0.2
}

extension CardTransitionManager: UIViewControllerAnimatedTransitioning {
    
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return transitionDuration
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning)
    {
        guard let fromViewController = transitionContext.viewController(forKey: .from),
                      let toViewController = transitionContext.viewController(forKey: .to) else {
                    return
                }

                let containerView = transitionContext.containerView

                if transition == .presentation {
                    // Set up your animation for presentation
                    // Calculate the initial and final frames for the transition
                    // Apply the animations and changes to the views

                    containerView.addSubview(toViewController.view)
                } else if transition == .dismissal {
                    // Set up your animation for dismissal
                    // Calculate the initial and final frames for the transition
                    // Apply the animations and changes to the views

                    toViewController.view.removeFromSuperview()
                }

                transitionContext.completeTransition(true)
            }
    }
    
    

extension CardTransitionManager: UIViewControllerTransitioningDelegate {
    
    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        transition = .presentation
        return self
    }
    
    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        transition = .dismissal
        return self
        
    }
    
}
