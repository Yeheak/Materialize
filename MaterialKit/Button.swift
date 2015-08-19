//
//  Button.swift
//  MaterialKit
//
//  Created by Adam Dahan on 2015-08-18.
//  Copyright (c) 2015 Adam Dahan. All rights reserved.
//

import UIKit

class Button : UIButton {
    override func drawRect(rect: CGRect){
        let path = UIBezierPath(rect: rect)
        path.lineWidth = 2
        UIColor.blueColor().set()
        path.stroke()
    }
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    required override init(frame: CGRect) {
        super.init(frame: frame)
        setTitleColor(UIColor.whiteColor(), forState: .Normal)
        setTitleShadowColor(UIColor.clearColor(), forState: .Normal)
        setTitle("+", forState: .Normal)
        titleLabel!.font = UIFont.systemFontOfSize(36.0)
        backgroundColor = UIColor.redColor()
        setTranslatesAutoresizingMaskIntoConstraints(false)
        titleEdgeInsets = UIEdgeInsetsMake(-5.0, 0, 0, 0)
    }
}
