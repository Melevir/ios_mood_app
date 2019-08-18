//
//  MoodPresenter.swift
//  MoodTracker
//
//  Created by Ilya Lebedev on 16/08/2019.
//  Copyright © 2019 Ilya Lebedev. All rights reserved.
//

import Foundation
import UIKit

enum MoodService {
    private static let moodColors = [
        (255, 51, 51, "Великолепно"),
        (255, 153, 51, "Прекрасно"),
        (255, 255, 51, "Отлично"),
        (0, 255, 0, "Хорошо"),
        (0, 255, 255, "Нормально"),
        (0, 128, 255, "Так себе"),
        (127, 0, 255, "Плохо"),
        (255, 0, 255, "Хуёво"),
        (128, 128, 128, "Пиздец")
    ]

    public static func getMoodInfo(moodIndex: Int) -> (UIColor, String)? {
        if moodColors.indices.contains(moodIndex) {
            let (red, green, blue, moodText) = moodColors[moodIndex]
            return (
                UIColor(red: CGFloat(red / 255), green: CGFloat(green / 255), blue: CGFloat(blue / 255), alpha: 1),
                moodText
            )
        }
        return nil
    }
}
