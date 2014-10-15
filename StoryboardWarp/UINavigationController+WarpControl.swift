/**
* @file		   UINavigationController+WarpControl.swift
* @brief		   UINavigationController extension use to push control
* @author	   Gin Van
* @version    1.0
* @date 		   14-10-15
* @copyright    Copyright (c) 2014 Gin. All rights reserved.
*
* # update (Update Log)
* [14-10-15] Gin Van v1.0
* + Create
*/

import Foundation
import UIKit

extension UINavigationController {
  override public func viewDidLoad() {
    super.viewDidLoad()
    UIViewController.exchangeMethod(oriClass: object_getClass(self), oriSel: Selector.convertFromStringLiteral("pushViewController:animated:"), newSel: Selector.convertFromStringLiteral("pushViewController_self:animated:"))
  }
  
  func pushViewController_self(viewController: UIViewController, animated: Bool) {
    if let target = viewController.target {
      if countElements(target) > 0 {
        if let storyboardName = NSBundle.mainBundle().pathForResource(target, ofType: "storyboardc") {
          let storyboard = UIStoryboard(name: target, bundle: nil)
          var warpTargetVC: UIViewController? = storyboard.instantiateInitialViewController() as? UIViewController
          if let vcId = viewController.vcId {
            warpTargetVC = storyboard.instantiateViewControllerWithIdentifier(vcId) as? UIViewController
          }
          
          if let warpTargetVC_unwarpped = warpTargetVC {
            warpTargetVC_unwarpped.passParamter = viewController.passParamter
            UIViewController.exchangeMethod(oriClass: object_getClass(self), oriSel: Selector.convertFromStringLiteral("pushViewController_self:animated:"), newSel: Selector.convertFromStringLiteral("pushViewController:animated:"))
            self.pushViewController(warpTargetVC_unwarpped, animated: animated)
            UIViewController.exchangeMethod(oriClass: object_getClass(self), oriSel: Selector.convertFromStringLiteral("pushViewController:animated:"), newSel: Selector.convertFromStringLiteral("pushViewController_self:animated:"))
            return
          }
        }
        else {
          println("[WARN]Storyboard (\(target)) not exist!")
        }
      }
    }
    UIViewController.exchangeMethod(oriClass: object_getClass(self), oriSel: Selector.convertFromStringLiteral("pushViewController_self:animated:"), newSel: Selector.convertFromStringLiteral("pushViewController:animated:"))
    self.pushViewController(viewController, animated: animated)
    UIViewController.exchangeMethod(oriClass: object_getClass(self), oriSel: Selector.convertFromStringLiteral("pushViewController:animated:"), newSel: Selector.convertFromStringLiteral("pushViewController_self:animated:"))
  }
}