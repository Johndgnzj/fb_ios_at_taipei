//
//  CALayer+Color.swift
//  TabBarSample
//
//  Created by John Chou on 2021/3/17.
//

import UIKit
@objc public extension CALayer{
    func addRoundCorners(color: UIColor, width: CGFloat = 1.0, radius: CGFloat = 8.0) {
        self.borderColor = color.cgColor
        self.borderWidth = width
        self.cornerRadius = radius
    }
    
}
