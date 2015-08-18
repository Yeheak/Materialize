//
//  Button.swift
//  MaterialKit
//
//  Created by Adam Dahan on 2015-08-18.
//  Copyright (c) 2015 Adam Dahan. All rights reserved.
//

import UIKit

extension UIButton {
    class func plusButton() -> UIButton {
        var plusButton = UIButton.buttonWithType(.Custom) as! UIButton
        plusButton.setTitle("+", forState: .Normal)
        plusButton.titleLabel!.font = UIFont.systemFontOfSize(36.0)
        plusButton.backgroundColor = UIColor.redColor()
        plusButton.setTranslatesAutoresizingMaskIntoConstraints(false)
        plusButton.layer.cornerRadius = 25.0
        plusButton.titleEdgeInsets = UIEdgeInsetsMake(-5.0, 0, 0, 0)
        return plusButton
    }
}

// This extension would not actually be here.

extension UIViewController {
    func pinBottomRight(customView: UIView) {
        self.view.addSubview(customView)
        var views = ["view" : customView]
        var viewBindingsDict: NSMutableDictionary = NSMutableDictionary()
        viewBindingsDict.setValue(customView, forKey: "customView")
        self.view.addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("H:[customView(50)]-(10)-|", options: nil, metrics: nil, views: viewBindingsDict as [NSObject : AnyObject]))
        self.view.addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("V:[customView(50)]-(10)-|", options: nil, metrics: nil, views: viewBindingsDict as [NSObject : AnyObject]))
    }
}
