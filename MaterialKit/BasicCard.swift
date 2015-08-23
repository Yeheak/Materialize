//
//  BasicCard.swift
//  MaterialKit
//
//  Created by Adam Dahan on 2015-08-22.
//  Copyright (c) 2015 Adam Dahan. All rights reserved.
//

import UIKit
import QuartzCore

class BasicCard : UIView {
    
    var views: NSMutableDictionary = NSMutableDictionary()
    
    var cancelButton: FlatButton = FlatButton()
    var otherButton: FlatButton = FlatButton()
    
    var color: UIColor?
    var pulseColor: UIColor?
    
    var titleLabel: UILabel = UILabel()
    var detailTextLabel: UILabel = UILabel()
    
    var horizontalSeparator: UIView = UIView()
    private var backgroundColorView: UIView?
    private var pulseView: UIView?
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        initialize()
    }
    
    required override init(frame: CGRect) {
        super.init(frame: frame)
        initialize()
    }
    
    func initialize() {
        setupSelf()
        setupLayer()
        setupTitleLabel()
        setupDetailTextLabel()
        setupHorizontalLineSeparator()
        setupButtons()
        setupBackgroundColorView()
        constrainSubviews()
    }
    
    func setupContext(rect: CGRect) {
        let context = UIGraphicsGetCurrentContext()
        CGContextSaveGState(context);
        CGContextSetFillColorWithColor(context, UIColor.clearColor().CGColor)
        CGContextFillRect(context, rect)
        CGContextRestoreGState(context)
    }
    
    func setupSelf() {
        color = UIColor.clearColor()
        pulseColor = UIColor.whiteColor()
        setTranslatesAutoresizingMaskIntoConstraints(false)
        backgroundColor = UIColor(red: 66.0/255.0, green: 91.0/255.0, blue: 103.0/255.0, alpha: 1.0)
    }
    
    func setupLayer() {
        self.layer.shadowColor = UIColor.blackColor().CGColor
        self.layer.shadowOffset = CGSizeMake(0.5, 0.5)
        self.layer.shadowRadius = 5.0
        self.layer.shadowOpacity = 0.4
        self.layer.cornerRadius = 2.0
    }
    
    func setupTitleLabel() {
        titleLabel.setTranslatesAutoresizingMaskIntoConstraints(false)
        titleLabel.font = UIFont.robotoRegularWithSize(22.0)
        titleLabel.textColor = UIColor.whiteColor()
        titleLabel.text = "Card Title"
        self.addSubview(titleLabel)
        views.setObject(titleLabel, forKey: "titleLabel")
    }
    
    func setupDetailTextLabel() {
        detailTextLabel.setTranslatesAutoresizingMaskIntoConstraints(false)
        detailTextLabel.font = UIFont.robotoLightWithSize(16.0)
        detailTextLabel.textColor = UIColor.whiteColor()
        detailTextLabel.text = "I am a very simple card. I am good at containing small bits of information. I am convenient because I require little markup to use effectively."
        detailTextLabel.numberOfLines = 0
        detailTextLabel.lineBreakMode = NSLineBreakMode.ByWordWrapping
        self.addSubview(detailTextLabel)
        views.setObject(detailTextLabel, forKey: "detailTextLabel")
    }
    
    func setupHorizontalLineSeparator() {
        horizontalSeparator.setTranslatesAutoresizingMaskIntoConstraints(false)
        horizontalSeparator.backgroundColor = UIColor.whiteColor()
        horizontalSeparator.alpha = 0.2
        self.addSubview(horizontalSeparator)
        views.setObject(horizontalSeparator, forKey: "line")
    }
    
    func setupButtons() {
        setupCancelButton()
        setupOtherButton()
    }
    
    func setupCancelButton() {
        cancelButton.setTranslatesAutoresizingMaskIntoConstraints(false)
        cancelButton.setTitle("Cancel", forState: .Normal)
        var orange = UIColor(red: 255.0/255.0, green: 156.0/255.0, blue: 38.0/255.0, alpha: 1.0)
        cancelButton.setTitleColor(orange, forState: .Normal)
        cancelButton.pulseColor = orange
        self.addSubview(cancelButton)
        views.setObject(cancelButton, forKey: "cancelButton")
    }
    
    func setupOtherButton() {
        otherButton.setTranslatesAutoresizingMaskIntoConstraints(false)
        otherButton.setTitle("Confirm", forState: .Normal)
        var orange = UIColor(red: 255.0/255.0, green: 156.0/255.0, blue: 38.0/255.0, alpha: 1.0)
        otherButton.setTitleColor(orange, forState: .Normal)
        otherButton.pulseColor = orange
        self.addSubview(otherButton)
        views.setObject(otherButton, forKey: "otherButton")
    }
    
    // We need this view so we can use the masksToBounds
    // so the pulse doesn't animate off the button
    func setupBackgroundColorView() {
        backgroundColorView = UIView()
        backgroundColorView!.setTranslatesAutoresizingMaskIntoConstraints(false)
        backgroundColorView!.layer.cornerRadius = 2.0
        backgroundColorView!.backgroundColor = color
        backgroundColorView!.layer.masksToBounds = true
        self.insertSubview(backgroundColorView!, atIndex: 0)
        views.setObject(backgroundColorView!, forKey: "bgView")
    }
    
    func constrainSubviews() {
        
        // Background
        self.addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("H:|-(0)-[bgView]-(0)-|", options: nil, metrics: nil, views: views as [NSObject : AnyObject]))
        self.addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("V:|-(0)-[bgView]-(0)-|", options: nil, metrics: nil, views: views as [NSObject : AnyObject]))
        
        // Title & Detail Text Label
        self.addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("H:|-(20)-[titleLabel]-(20)-|", options: nil, metrics: nil, views: views as [NSObject : AnyObject]))
        self.addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("H:|-(20)-[detailTextLabel]-(20)-|", options: nil, metrics: nil, views: views as [NSObject : AnyObject]))
        
        // Horizontal line
        self.addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("H:|-(0)-[line]-(0)-|", options: nil, metrics: nil, views: views as [NSObject : AnyObject]))
        
        // Cancel & Other Button
        self.addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("H:|-(10)-[cancelButton(80)]-(10)-[otherButton(80)]", options: nil, metrics: nil, views: views as [NSObject : AnyObject]))
        
        self.addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("V:|-(20)-[titleLabel(22)]-(10)-[detailTextLabel]-(20)-[line(1)]-(10)-[cancelButton]-(10)-|", options: nil, metrics: nil, views: views as [NSObject : AnyObject]))
        
        self.addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("V:|-(20)-[titleLabel(22)]-(10)-[detailTextLabel]-(20)-[line(1)]-(10)-[otherButton]-(10)-|", options: nil, metrics: nil, views: views as [NSObject : AnyObject]))
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
        pulseView?.setTranslatesAutoresizingMaskIntoConstraints(false)
        var width = boundsW() / 3.0
        pulseView!.frame = CGRectMake(0, 0, width, width)
        pulseView!.layer.cornerRadius = width / 2.0
        pulseView!.center = touchLocation
        pulseView!.backgroundColor = pulseColor!.colorWithAlphaComponent(0.1)
        backgroundColorView!.addSubview(pulseView!)
        UIView.animateWithDuration(0.3, animations: {
            self.pulseView!.transform = CGAffineTransformMakeScale(3, 3)
            self.transform = CGAffineTransformMakeScale(1.05, 1.05)
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
