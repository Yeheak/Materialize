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
        
        var floatingButton = FloatingButton()
        self.bottomRight(floatingButton, w: 100, h: 100, b: 20, br: 20)
    }
}

