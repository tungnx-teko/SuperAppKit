//
//  AppControllerDelegate.swift
//  SuperAppKit
//
//  Created by Tung Nguyen on 7/31/20.
//  Copyright © 2020 Tung Nguyen. All rights reserved.
//

import UIKit

public protocol AppControllerDelegate {
    func didChangeRoot(_ controller: AppController, rootVC: UIViewController?)
}
