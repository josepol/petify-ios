//
//  PictureDisplayerView.swift
//  petify
//
//  Created by Jose Pol Sastre on 26/9/17.
//  Copyright © 2017 Jose Pol Sastre. All rights reserved.
//

import UIKit

@IBDesignable
class PictureDisplayerView: UIView {

    @IBInspectable var cornerRadius: CGFloat = 0 {
        didSet {
            layer.cornerRadius = cornerRadius
            layer.masksToBounds = cornerRadius > 0
        }
    }
    @IBInspectable var borderWidth: CGFloat = 0 {
        didSet {
            layer.borderWidth = borderWidth
        }
    }
    @IBInspectable var borderColor: UIColor? {
        didSet {
            layer.borderColor = borderColor?.cgColor
        }
    }

}
