//
//  Button.swift
//  MaterialKit
//
//  Created by Adam Dahan on 2015-08-18.
//  Copyright (c) 2015 Adam Dahan. All rights reserved.
//

import UIKit

class FloatingButton : UIButton {
    
    var colorView: UIView?
    var pulseView: UIView?
    
    override func drawRect(rect: CGRect) {
        let context = UIGraphicsGetCurrentContext()
        CGContextSaveGState(context);
        CGContextAddEllipseInRect(context, rect)
        CGContextSetFillColorWithColor(context, UIColor.clearColor().CGColor)
        CGContextFillPath(context)
        CGContextRestoreGState(context);
        
        colorView = UIView()
        colorView!.frame = self.bounds
        colorView!.layer.cornerRadius = boundsW() / 2.0
        colorView!.backgroundColor = UIColor.redColor()
        colorView!.layer.masksToBounds = true
        self.addSubview(colorView!)
    }
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        initialize()
        applyShadow()
    }
    
    required override init(frame: CGRect) {
        super.init(frame: frame)
        initialize()
        applyShadow()
    }
    
    func initialize() {
        setTranslatesAutoresizingMaskIntoConstraints(false)
    }
    
    func applyShadow() {
        layer.shadowOffset = CGSizeMake(1, 1)
        layer.shadowColor = UIColor.blackColor().CGColor
        layer.shadowOpacity = 0.5
        layer.shadowRadius = 5
    }
    
    override func touchesBegan(touches: Set<NSObject>, withEvent event: UIEvent) {
        pulseTouches(touches)
    }
    
    override func touchesEnded(touches: Set<NSObject>, withEvent event: UIEvent) {
        shrink()
        removePulse()
    }
    
    func pulseTouches(touches: NSSet) {
        let touch = touches.allObjects.last as! UITouch
        let touchLocation = touch.locationInView(self)
        pulseView = UIView()
        pulseView!.frame = CGRectMake(0, 0, colorView!.bounds.size.width, colorView!.bounds.size.height)
        pulseView!.layer.cornerRadius = boundsW() / 2.0
        pulseView!.center = touchLocation
        pulseView!.backgroundColor = UIColor.whiteColor().colorWithAlphaComponent(0.5)
        colorView!.addSubview(pulseView!)
        UIView.animateWithDuration(0.3, animations: {
           self.pulseView!.transform = CGAffineTransformMakeScale(2, 2)
           self.transform = CGAffineTransformMakeScale(1.1, 1.1)
        }, completion: nil)
    }
    
    func shrink() {
        UIView.animateWithDuration(0.2, delay: 0.0, usingSpringWithDamping: 0.2, initialSpringVelocity: 10, options: nil, animations: {
            self.transform = CGAffineTransformIdentity
        }, completion: nil)
    }
    
    func removePulse() {
        UIView.animateWithDuration(0.3, animations: { () -> Void in
            self.pulseView?.alpha = 0.0
        }) { (finished) -> Void in
            self.pulseView?.removeFromSuperview()
            self.pulseView = nil
        }
    }
}
