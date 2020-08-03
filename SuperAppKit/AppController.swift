//
//  TerraApplication.swift
//  SuperAppKit
//
//  Created by Tung Nguyen on 7/31/20.
//  Copyright © 2020 Tung Nguyen. All rights reserved.
//

import Foundation
import UIKit

open class AppController {
    
    open var nav: UINavigationController?
    
    open var rootVC: UIViewController? {
        didSet {
            guard var viewControllers = nav?.viewControllers, let vc = rootVC else { return }
            viewControllers[rootIndex] = vc
            delegate?.didChangeRoot(self, rootVC: rootVC)
        }
    }
    
    open var delegate: AppControllerDelegate?
    
    var rootIndex: Int = 0
    
    public init() {
        
    }

    open func appDidFinishLaunching(options: [UIApplication.LaunchOptionsKey: Any]?) {
        
    }
    
}
