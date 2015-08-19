//
//  UIView.swift
//  MaterialKit
//
//  Created by Adam Dahan on 2015-08-19.
//  Copyright (c) 2015 Adam Dahan. All rights reserved.
//

import UIKit

extension UIView {

    func frameW() -> CGFloat {
        return self.frame.size.width
    }
    
    func frameH() -> CGFloat {
        return self.frame.size.height
    }
    
    func frameX() -> CGFloat {
        return self.frame.origin.x
    }
    
    func frameY() -> CGFloat {
        return self.frame.origin.y
    }
    
    func boundsW() -> CGFloat {
        return self.bounds.size.width
    }
    
    func boundsH() -> CGFloat {
        return self.bounds.size.height
    }
    
    func boundsX() -> CGFloat {
        return self.bounds.origin.x
    }
    
    func boundsY() -> CGFloat {
        return self.bounds.origin.y
    }
    
}
