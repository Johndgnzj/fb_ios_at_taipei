//
//  UIView+RoundCorner.swift
//  TabBarSample
//
//  Created by John Chou on 2021/3/17.
//

import Foundation
import UIKit
@objc extension UIView {
    public func roundCorners(corners:UIRectCorner, radius: CGFloat) {
        let path = UIBezierPath(roundedRect: self.bounds, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        let mask = CAShapeLayer()
        mask.path = path.cgPath
        self.layer.mask = mask
    }
    public func addRoundCorners(color: UIColor, width: CGFloat = 1.0, radius: CGFloat = 8.0) {
        self.layer.addRoundCorners(color: color, width: width, radius: radius)
    }
    
    public func dropShadow(color: UIColor, opacity: Float = 0.5, offSet: CGSize, radius: CGFloat = 1, scale: Bool = true) {
        self.layer.masksToBounds = false
        self.layer.shadowColor = color.cgColor
        self.layer.shadowOpacity = opacity
        self.layer.shadowOffset = offSet
        self.layer.shadowRadius = radius
    }
   
}
