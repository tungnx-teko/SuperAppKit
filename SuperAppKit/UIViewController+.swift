//
//  UIViewController+.swift
//  SuperAppKit
//
//  Created by Tung Nguyen on 7/31/20.
//  Copyright © 2020 Tung Nguyen. All rights reserved.
//

import UIKit

public extension UIViewController {
    
    func open(controller: AppController, delegate: AppControllerDelegate? = nil) {
        controller.appDidFinishLaunching(options: nil)
        guard let appRootVC = controller.rootVC else { return }
        if let currentNav = self.navigationController {
            controller.rootIndex = currentNav.viewControllers.count
            controller.nav = currentNav
            currentNav.pushViewController(appRootVC, animated: true)
        } else {
            let nav = UINavigationController(rootViewController: appRootVC)
            
            let transition = CATransition()
            transition.duration = 0.5
            transition.type = CATransitionType.push
            transition.subtype = CATransitionSubtype.fromRight
            transition.timingFunction = CAMediaTimingFunction(name:CAMediaTimingFunctionName.easeInEaseOut)
            view.window!.layer.add(transition, forKey: kCATransition)
            
            controller.rootIndex = 0
            controller.nav = nav
            self.present(nav, animated: false, completion: nil)
        }
    }
    
}
