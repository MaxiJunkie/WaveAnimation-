//
//  testView.swift
//  WaveAnimation
//
//  Created by Максим Стегниенко on 13.06.17.
//  Copyright © 2017 Максим Стегниенко. All rights reserved.
//

import UIKit

class testView: UIImageView {

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

