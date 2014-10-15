/**
* @file		   UIViewController+ParamAttach.swift
* @brief		   UIViewController extension to take parameters
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
import ObjectiveC

private var targetAssociationKey: UInt8 = 0
private var vcIdKey: UInt8 = 0
private var passParamterKey: UInt8 = 0

extension UIViewController {
  var target: String? {
    get {
      return objc_getAssociatedObject(self, &targetAssociationKey) as? String
    }
    set {
      objc_setAssociatedObject(self, &targetAssociationKey, newValue, UInt(OBJC_ASSOCIATION_RETAIN))
    }
  }
  
  var vcId: String? {
    get {
      return objc_getAssociatedObject(self, &vcIdKey) as? String
    }
    set {
      objc_setAssociatedObject(self, &vcIdKey, newValue, UInt(OBJC_ASSOCIATION_RETAIN))
    }
  }
  
  var passParamter: [String: AnyObject]? {
    get {
      return objc_getAssociatedObject(self, &passParamterKey) as? [String: AnyObject]
    }
    set {
      objc_setAssociatedObject(self, &passParamterKey, newValue, UInt(OBJC_ASSOCIATION_RETAIN))
    }
  }
  
  /**
  Function Swizzling
  See: http://stackoverflow.com/questions/24019683/swift-function-swizzling-runtime
  
  :param: oriClass Origin Class
  :param: origSel  Origin Selector
  :param: newSel   New Selector
  */
  class func exchangeMethod(#oriClass: AnyClass, oriSel: Selector, newSel: Selector) {
    assert((class_getInstanceMethod(oriClass, oriSel) != nil || class_getClassMethod(oriClass, oriSel) != nil), "Can't find origin method!")
    assert((class_getInstanceMethod(oriClass, newSel) != nil || class_getClassMethod(oriClass, newSel) != nil), "Can't find new method!")
    assert(oriSel != newSel, "Origin method can't equel with new method!")
    
    let oriMethod = (class_getInstanceMethod(oriClass, oriSel) != nil) ? class_getInstanceMethod(oriClass, oriSel) : class_getClassMethod(oriClass, oriSel)
    let newMethod = (class_getInstanceMethod(oriClass, newSel) != nil) ? class_getInstanceMethod(oriClass, newSel) : class_getClassMethod(oriClass, newSel)
    method_exchangeImplementations(oriMethod, newMethod)
  }
}
