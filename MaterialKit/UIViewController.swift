//
//  Button.swift
//  MaterialKit
//
//  Created by Adam Dahan on 2015-08-18.
//  Copyright (c) 2015 Adam Dahan. All rights reserved.
//

import UIKit

extension UIViewController {
    
    
    func bottomRight(customView: UIView, w: CGFloat, h: CGFloat, b: CGFloat, br: CGFloat) {
        self.view.addSubview(customView)
        var metrics = ["w" : w + 10, "h" : h + 10, "b" : b, "br" : br]
        var views = ["view" : customView]
        var viewBindingsDict: NSMutableDictionary = NSMutableDictionary()
        viewBindingsDict.setValue(customView, forKey: "customView")
        self.view.addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("H:[customView(w)]-(br)-|", options: nil, metrics: metrics, views: viewBindingsDict as [NSObject : AnyObject]))
        self.view.addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("V:[customView(h)]-(b)-|", options: nil, metrics: metrics, views: viewBindingsDict as [NSObject : AnyObject]))
    }
    
    func bottomLeft(customView: UIView, w: CGFloat, h: CGFloat, b: CGFloat, bl: CGFloat) {
        self.view.addSubview(customView)
        var metrics = ["w" : w, "h" : h, "b" : b, "bl" : bl]
        var views = ["view" : customView]
        var viewBindingsDict: NSMutableDictionary = NSMutableDictionary()
        viewBindingsDict.setValue(customView, forKey: "customView")
        self.view.addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("H:|-(bl)-[customView(w)]", options: nil, metrics: metrics, views: viewBindingsDict as [NSObject : AnyObject]))
        self.view.addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("V:[customView(h)]-(b)-|", options: nil, metrics: metrics, views: viewBindingsDict as [NSObject : AnyObject]))
    }
}
