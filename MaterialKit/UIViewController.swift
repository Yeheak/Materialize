//
//  Button.swift
//  MaterialKit
//
//  Created by Adam Dahan on 2015-08-18.
//  Copyright (c) 2015 Adam Dahan. All rights reserved.
//

import UIKit

extension UIViewController {
    
    func topRight(customView: UIView, w: CGFloat, h: CGFloat, t: CGFloat, tr: CGFloat) {
        self.view.addSubview(customView)
        var metrics = ["w" : w, "h" : h, "t" : t, "tr" : tr]
        var views = ["view" : customView]
        var viewBindingsDict: NSMutableDictionary = NSMutableDictionary()
        viewBindingsDict.setValue(customView, forKey: "customView")
        self.view.addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("H:[customView(w)]-(tr)-|", options: nil, metrics: metrics, views: viewBindingsDict as [NSObject : AnyObject]))
        self.view.addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("V:|-(t)-[customView(h)]", options: nil, metrics: metrics, views: viewBindingsDict as [NSObject : AnyObject]))
    }
    
    func topLeft(customView: UIView, w: CGFloat, h: CGFloat, t: CGFloat, tl: CGFloat) {
        self.view.addSubview(customView)
        var metrics = ["w" : w, "h" : h, "t" : t, "tl" : tl]
        var views = ["view" : customView]
        var viewBindingsDict: NSMutableDictionary = NSMutableDictionary()
        viewBindingsDict.setValue(customView, forKey: "customView")
        self.view.addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("H:|-(tl)-[customView(w)]", options: nil, metrics: metrics, views: viewBindingsDict as [NSObject : AnyObject]))
        self.view.addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("V:|-(t)-[customView(h)]", options: nil, metrics: metrics, views: viewBindingsDict as [NSObject : AnyObject]))
    }
    
    func bottomRight(customView: UIView, w: CGFloat, h: CGFloat, b: CGFloat, br: CGFloat) {
        self.view.addSubview(customView)
        var metrics = ["w" : w, "h" : h, "b" : b, "br" : br]
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
