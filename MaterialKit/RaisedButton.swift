//
//  RaisedButton.swift
//  MaterialKit
//
//  Created by Adam Dahan on 2015-08-19.
//  Copyright (c) 2015 Adam Dahan. All rights reserved.
//

import UIKit

class RaisedButton : UIButton {
    
    var color: UIColor?
    
    private var vLine: UIView = UIView()
    private var hLine: UIView = UIView()
    private var backgroundColorView: UIView = UIView()
    private var pulseView: UIView?
    
    override func drawRect(rect: CGRect) {
        setupContext(rect)
        setupBackgroundColorView()
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
        color = UIColor.redColor()
        setTranslatesAutoresizingMaskIntoConstraints(false)
    }
    
    func setupContext(rect: CGRect) {
        let context = UIGraphicsGetCurrentContext()
        CGContextSaveGState(context);
        CGContextSetFillColorWithColor(context, UIColor.clearColor().CGColor)
        CGContextFillPath(context)
        CGContextRestoreGState(context);
    }
    
    // We need this view so we can use the masksToBounds
    // so the pulse doesn't animate off the button
    func setupBackgroundColorView() {
        backgroundColorView.frame = self.bounds
        backgroundColorView.layer.cornerRadius = 3.0
        backgroundColorView.backgroundColor = color
        backgroundColorView.layer.masksToBounds = true
        self.insertSubview(backgroundColorView, atIndex: 0)
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
        pulseView!.frame = CGRectMake(0, 0, self.bounds.size.height, self.bounds.size.height)
        pulseView!.layer.cornerRadius = boundsH() / 2.0
        pulseView!.center = touchLocation
        pulseView!.backgroundColor = UIColor.whiteColor().colorWithAlphaComponent(0.5)
        backgroundColorView.addSubview(pulseView!)
        UIView.animateWithDuration(0.3, animations: {
            self.pulseView!.transform = CGAffineTransformMakeScale(10, 10)
            self.transform = CGAffineTransformMakeScale(1.1, 1.1)
        }, completion: nil)
    }
    
    func shrink() {
        UIView.animateWithDuration(0.3, delay: 0.0, usingSpringWithDamping: 0.2, initialSpringVelocity: 10, options: nil, animations: {
            self.transform = CGAffineTransformIdentity
        }, completion: nil)
    }
    
    func removePulse() {
        UIView.animateWithDuration(0.3, animations: { () -> Void in
            self.pulseView!.alpha = 0.0
            }) { (finished) -> Void in
            self.pulseView!.removeFromSuperview()
            self.pulseView = nil
        }
    }
}

