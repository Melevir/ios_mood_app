//
//  MoodSelectorView.swift
//  MoodTracker
//
//  Created by Ilya Lebedev on 11/08/2019.
//  Copyright © 2019 Ilya Lebedev. All rights reserved.
//

import UIKit

class MoodSelectorView: UIView {
    private var fillColor: UIColor?

    override func draw(_ rect: CGRect) {
        let roundedRect = UIBezierPath(roundedRect: bounds, cornerRadius: 20)
        roundedRect.addClip()
        let color = fillColor ?? UIColor.white
        color.setFill()
        roundedRect.fill()
    }

    public func redrawWith(color: UIColor) {
        fillColor = color
        setNeedsDisplay()
    }

}
