//
//  ViewController.swift
//  MaterialKit
//
//  Created by Adam Dahan on 2015-08-18.
//  Copyright (c) 2015 Adam Dahan. All rights reserved.
//

import UIKit
import MaterialKit

class ViewController: UIViewController {
    
    var views: NSMutableDictionary = NSMutableDictionary()
    
    // Cards
    var basicCard: BasicCard = BasicCard()
    var basicCardTwo: BasicCard = BasicCard()
    var imageCard: ImageCard = ImageCard()
    
    // Buttons
    var fabButton: FabButton = FabButton()
    var raisedButtonWithTitle: RaisedButton = RaisedButton()
    var flatButtonWithTitle: FlatButton = FlatButton()
    var raisedButtonWithImage: RaisedButton = RaisedButton()
    var raisedButtonWithTitleImage: RaisedButton = RaisedButton()
    
    @IBOutlet weak var scrollView: UIScrollView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupCards()
        setupRaisedButtons()
        setupFabButton()
        constrainSubViews()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        scrollView.contentSize = CGSizeMake(view.bounds.size.width, 2000)
    }
    
    func setupCards() {
        setupBasicCard()
        setupBasicCardTwo()
        setupImageCard()
    }
    
    func setupBasicCard() {
        scrollView.addSubview(basicCard)
        basicCard.cancelButton.layer.shadowColor = UIColor.clearColor().CGColor
        basicCard.otherButton.layer.shadowColor = UIColor.clearColor().CGColor
        views.setObject(basicCard, forKey: "basicCard")
    }
    
    func setupBasicCardTwo() {
        scrollView.addSubview(basicCardTwo)
        basicCardTwo.backgroundColor = UIColor.whiteColor()
        basicCardTwo.cancelButton.setTitleColor(UIColor.darkGrayColor(), forState: .Normal)
        basicCardTwo.cancelButton.layer.shadowColor = UIColor.clearColor().CGColor
        basicCardTwo.otherButton.setTitleColor(UIColor.darkGrayColor(), forState: .Normal)
        basicCardTwo.otherButton.layer.shadowColor = UIColor.clearColor().CGColor
        basicCardTwo.cancelButton.pulseColor = UIColor.darkGrayColor()
        basicCardTwo.otherButton.pulseColor = UIColor.darkGrayColor()
        basicCardTwo.pulseColor = UIColor.lightGrayColor()
        basicCardTwo.titleLabel.textColor = UIColor.darkGrayColor()
        basicCardTwo.detailTextLabel.textColor = UIColor.darkGrayColor()
        basicCardTwo.horizontalSeparator.backgroundColor = UIColor.darkGrayColor()
        views.setObject(basicCardTwo, forKey: "basicCardTwo")
    }
    
    func setupImageCard() {
        imageCard.imageView.image = UIImage(named: "beach")
        scrollView.addSubview(imageCard)
        views.setObject(imageCard, forKey: "imageCard")
    }
    
    func setupRaisedButtons() {
        setupRaisedButtonWithTitle()
        setupRaisedButtonFlatWithTitle()
        setupRaisedButtonWithImage()
        setupRaisedButtonWithTitleImage()
    }
    
    func setupRaisedButtonWithTitle() {
        raisedButtonWithTitle.setTitle("Button", forState: .Normal)
        raisedButtonWithTitle.addTarget(self, action: "raisedButtonWithTitle", forControlEvents: UIControlEvents.TouchUpInside)
        raisedButtonWithTitle.color = UIColor.purpleColor()
        scrollView.addSubview(raisedButtonWithTitle)
        views.setObject(raisedButtonWithTitle, forKey: "buttonTitle")
    }
    
    func setupRaisedButtonFlatWithTitle() {
        flatButtonWithTitle.setTitle("Button", forState: .Normal)
        flatButtonWithTitle.setTitleColor(UIColor.purpleColor(), forState: .Normal)
        flatButtonWithTitle.addTarget(self, action: "raisedButtonWithTitle", forControlEvents: UIControlEvents.TouchUpInside)
        flatButtonWithTitle.pulseColor = UIColor.purpleColor()
        scrollView.addSubview(flatButtonWithTitle)
        views.setObject(flatButtonWithTitle, forKey: "buttonFlatTitle")
    }
    
    func setupRaisedButtonWithImage() {
        raisedButtonWithImage.color = UIColor.purpleColor()
        raisedButtonWithImage.setImage(UIImage(named: "clouds"), forState: .Normal)
        scrollView.addSubview(raisedButtonWithImage)
        views.setObject(raisedButtonWithImage, forKey: "buttonImage")
    }
    
    func setupRaisedButtonWithTitleImage() {
        raisedButtonWithTitleImage.color = UIColor.purpleColor()
        raisedButtonWithTitleImage.setImage(UIImage(named: "clouds"), forState: .Normal)
        raisedButtonWithTitleImage.setTitle("Button", forState: .Normal)
        raisedButtonWithTitleImage.addTarget(self, action: "raisedButtonWithTitle", forControlEvents: UIControlEvents.TouchUpInside)
        raisedButtonWithTitleImage.titleEdgeInsets = UIEdgeInsetsMake(0, 10.0, 0, 0)
        raisedButtonWithTitleImage.imageEdgeInsets = UIEdgeInsetsMake(0, -10, 0, 0)
        scrollView.addSubview(raisedButtonWithTitleImage)
        views.setObject(raisedButtonWithTitleImage, forKey: "buttonTitleImage")
    }
    
    func setupFabButton() {
        self.view.addSubview(fabButton)
        Layout.width(self.view, child: fabButton, width: 60)
        Layout.height(self.view, child: fabButton, height: 60)
        Layout.alignFromBottomRight(self.view, child: fabButton, bottom: 20, right: 20)
    }
    
    func constrainSubViews() {
        let metrics = ["cardWidth" : self.view.bounds.size.width - 40, "cardHeight" : 230, "buttonWidth" : self.view.bounds.size.width - 40, "buttonHeight" : 50]
        scrollView.addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("H:|-(20)-[basicCard(cardWidth)]-(20)-|", options: nil, metrics: metrics, views: views as [NSObject : AnyObject]))
        scrollView.addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("H:|-(20)-[basicCardTwo(cardWidth)]-(20)-|", options: nil, metrics: metrics, views: views as [NSObject : AnyObject]))
        scrollView.addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("H:|-(20)-[imageCard(cardWidth)]-(20)-|", options: nil, metrics: metrics, views: views as [NSObject : AnyObject]))
        scrollView.addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("H:|-(20)-[buttonTitle(buttonWidth)]", options: nil, metrics: metrics, views: views as [NSObject : AnyObject]))
        scrollView.addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("H:|-(20)-[buttonFlatTitle(buttonWidth)]", options: nil, metrics: metrics, views: views as [NSObject : AnyObject]))
        scrollView.addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("H:|-(20)-[buttonImage(buttonWidth)]", options: nil, metrics: metrics, views: views as [NSObject : AnyObject]))
        scrollView.addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("H:|-(20)-[buttonTitleImage(buttonWidth)]", options: nil, metrics: metrics, views: views as [NSObject : AnyObject]))
        
        scrollView.addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("V:|-(60)-[basicCard(cardHeight)]-(60)-[basicCardTwo(cardHeight)]-(60)-[imageCard(cardHeight)]-(60)-[buttonTitle(buttonHeight)]-(20)-[buttonImage(buttonHeight)]-(20)-[buttonTitleImage(buttonHeight)]-(20)-[buttonFlatTitle(buttonHeight)]", options: nil, metrics: metrics, views: views as [NSObject : AnyObject]))
    }
}

