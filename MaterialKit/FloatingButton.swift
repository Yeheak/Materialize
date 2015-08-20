//
//  Button.swift
//  MaterialKit
//
//  Created by Adam Dahan on 2015-08-18.
//  Copyright (c) 2015 Adam Dahan. All rights reserved.
//

import UIKit

class FloatingButton : UIButton {
    
    var lineWidth: CGFloat = 2.0
    var color: UIColor?
    
    private var vLine: UIView?
    private var hLine: UIView?
    private var backgroundColorView: UIView?
    private var pulseView: UIView?
    
    override func drawRect(rect: CGRect) {
        setupContext(rect)
        setupBackgroundColorView()
        setupPlus()
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
        CGContextAddEllipseInRect(context, rect)
        CGContextSetFillColorWithColor(context, UIColor.clearColor().CGColor)
        CGContextFillPath(context)
        CGContextRestoreGState(context);
    }
    
    // We need this view so we can use the masksToBounds
    // so the pulse doesn't animate off the button
    func setupBackgroundColorView() {
        backgroundColorView = UIView()
        backgroundColorView!.frame = self.bounds
        backgroundColorView!.layer.cornerRadius = boundsW() / 2.0
        backgroundColorView!.backgroundColor = color
        backgroundColorView!.layer.masksToBounds = true
        self.insertSubview(backgroundColorView!, atIndex: 0)
    }
    
    // I make the + with two views because
    // The label is not actually vertically and horizontally aligned
    // Quick hack instead of subclassing UILabel and override drawTextInRect
    func setupPlus() {
        setupVerticalLine()
        setupHorizontalLine()
    }
    
    func setupVerticalLine() {
        vLine = UIView(frame: CGRectMake(0, 0, lineWidth, CGRectGetHeight(backgroundColorView!.frame) / 3.0))
        vLine!.backgroundColor = UIColor.whiteColor()
        vLine!.center = backgroundColorView!.center
        backgroundColorView!.addSubview(vLine!)
    }
    
    func setupHorizontalLine() {
        hLine = UIView(frame: CGRectMake(0, 0, CGRectGetWidth(backgroundColorView!.frame) / 3.0, lineWidth))
        hLine!.backgroundColor = UIColor.whiteColor()
        hLine!.center = backgroundColorView!.center
        backgroundColorView!.addSubview(hLine!)
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
        pulseView!.frame = CGRectMake(0, 0, boundsW(), boundsH())
        pulseView!.layer.cornerRadius = boundsW() / 2.0
        pulseView!.center = touchLocation
        pulseView!.backgroundColor = UIColor.whiteColor().colorWithAlphaComponent(0.5)
        backgroundColorView!.addSubview(pulseView!)
        UIView.animateWithDuration(0.3, animations: {
           self.pulseView!.transform = CGAffineTransformMakeScale(3, 3)
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
            self.pulseView?.alpha = 0.0
        }) { (finished) -> Void in
            self.pulseView?.removeFromSuperview()
            self.pulseView = nil
        }
    }
}
