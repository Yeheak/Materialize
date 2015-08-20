//
//  ViewController.swift
//  MaterialKit
//
//  Created by Adam Dahan on 2015-08-18.
//  Copyright (c) 2015 Adam Dahan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Rounded Button
        var floatingButton = FloatingButton()
        self.bottomRight(floatingButton, w: 100, h: 100, b: 20, br: 20)
        
        // Raised Button with Title
        var raisedButton = RaisedButton()
        raisedButton.setTitle("Button", forState: .Normal)
        raisedButton.color = UIColor.purpleColor()
        self.bottomLeft(raisedButton, w: 140, h: 40, b: 20, bl: 20)
        
        // Raised Button with Image
        var raisedTrButton = RaisedButton()
        raisedTrButton.color = UIColor.purpleColor()
        raisedTrButton.setImage(UIImage(named: "clouds"), forState: .Normal)
        self.topRight(raisedTrButton, w: 140, h: 40, t: 40, tr: 20)
        
        // Raised Button with Title & Image
        var raisedTLButton = RaisedButton()
        raisedTLButton.color = UIColor.purpleColor()
        raisedTLButton.setImage(UIImage(named: "clouds"), forState: .Normal)
        raisedTLButton.setTitle("Button", forState: .Normal)
        raisedTLButton.titleEdgeInsets = UIEdgeInsetsMake(0, 10.0, 0, 0)
        raisedTLButton.imageEdgeInsets = UIEdgeInsetsMake(0, -10, 0, 0)
        self.topLeft(raisedTLButton, w: 140, h: 40, t: 40, tl: 20)
    }
}

