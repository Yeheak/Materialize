//
//  ViewController.swift
//  MaterialKit
//
//  Created by Adam Dahan on 2015-08-18.
//  Copyright (c) 2015 Adam Dahan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var views: NSMutableDictionary = NSMutableDictionary()
    
    var floatingButton: FloatingButton = FloatingButton()
    var raisedButtonWithTitle: RaisedButton = RaisedButton()
    var flatButtonWithTitle: FlatButton = FlatButton()
    var raisedButtonWithImage: RaisedButton = RaisedButton()
    var raisedButtonWithTitleImage: RaisedButton = RaisedButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupRaisedButtons()
        setupFloatingButton()
        constrainSubviews()
    }
    
    func setupRaisedButtons() {
        setupRaisedButtonWithTitle()
        setupRaisedButtonFlatWithTitle()
        setupRaisedButtonWithImage()
        setupRaisedButtonWithTitleImage()
    }
    
    func setupRaisedButtonWithTitle() {
        raisedButtonWithTitle.setTitle("Button", forState: .Normal)
        raisedButtonWithTitle.color = UIColor.purpleColor()
        self.view.addSubview(raisedButtonWithTitle)
        views.setObject(raisedButtonWithTitle, forKey: "buttonTitle")
    }
    
    func setupRaisedButtonFlatWithTitle() {
        flatButtonWithTitle.setTitle("Button", forState: .Normal)
        flatButtonWithTitle.setTitleColor(UIColor.purpleColor(), forState: .Normal)
        flatButtonWithTitle.pulseColor = UIColor.purpleColor()
        self.view.addSubview(flatButtonWithTitle)
        views.setObject(flatButtonWithTitle, forKey: "buttonFlatTitle")
    }
    
    func setupRaisedButtonWithImage() {
        raisedButtonWithImage.color = UIColor.purpleColor()
        raisedButtonWithImage.setImage(UIImage(named: "clouds"), forState: .Normal)
        self.view.addSubview(raisedButtonWithImage)
        views.setObject(raisedButtonWithImage, forKey: "buttonImage")
    }
    
    func setupRaisedButtonWithTitleImage() {
        raisedButtonWithTitleImage.color = UIColor.purpleColor()
        raisedButtonWithTitleImage.setImage(UIImage(named: "clouds"), forState: .Normal)
        raisedButtonWithTitleImage.setTitle("Button", forState: .Normal)
        raisedButtonWithTitleImage.titleEdgeInsets = UIEdgeInsetsMake(0, 10.0, 0, 0)
        raisedButtonWithTitleImage.imageEdgeInsets = UIEdgeInsetsMake(0, -10, 0, 0)
        self.view.addSubview(raisedButtonWithTitleImage)
        views.setObject(raisedButtonWithTitleImage, forKey: "buttonTitleImage")
    }
    
    func setupFloatingButton() {
        self.bottomRight(floatingButton, w: 60, h: 60, b: 20, br: 20)
    }
    
    func constrainSubviews() {
        let metrics = ["buttonWidth" : self.view.bounds.size.width - 40, "buttonHeight" : 50]
        self.view.addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("H:|-(20)-[buttonTitle(buttonWidth)]", options: nil, metrics: metrics, views: views as [NSObject : AnyObject]))
        self.view.addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("H:|-(20)-[buttonFlatTitle(buttonWidth)]", options: nil, metrics: metrics, views: views as [NSObject : AnyObject]))
        self.view.addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("H:|-(20)-[buttonImage(buttonWidth)]", options: nil, metrics: metrics, views: views as [NSObject : AnyObject]))
        self.view.addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("H:|-(20)-[buttonTitleImage(buttonWidth)]", options: nil, metrics: metrics, views: views as [NSObject : AnyObject]))
        self.view.addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("V:|-(60)-[buttonTitle(buttonHeight)]-(20)-[buttonImage(buttonHeight)]-(20)-[buttonTitleImage(buttonHeight)]-(20)-[buttonFlatTitle(buttonHeight)]", options: nil, metrics: metrics, views: views as [NSObject : AnyObject]))
    }
}

