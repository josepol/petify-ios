//
//  CellView.swift
//  petify
//
//  Created by Jose Pol Sastre on 22/9/17.
//  Copyright © 2017 Jose Pol Sastre. All rights reserved.
//

import UIKit

@IBDesignable
class CellView: UIView {
    
    @IBInspectable var cornerRadius: CGFloat {
        get {
            return layer.cornerRadius
        }
        set {
            layer.cornerRadius = newValue
            layer.masksToBounds = newValue > 0
        }
    }

}
