//
//  Button.swift
//  MaterialKit
//
//  Created by Adam Dahan on 2015-08-18.
//  Copyright (c) 2015 Adam Dahan. All rights reserved.
//

import UIKit

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
