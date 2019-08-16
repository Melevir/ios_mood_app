//
//  MoodPresenter.swift
//  MoodTracker
//
//  Created by Ilya Lebedev on 16/08/2019.
//  Copyright © 2019 Ilya Lebedev. All rights reserved.
//

import Foundation
import UIKit

class MoodPresenter {
    private static let moodColors = [
        (UIColor(red: 255/255, green: 51/255, blue: 51/255, alpha: 1), "Великолепно"),
        (UIColor(red: 255/255, green: 153/255, blue: 51/255, alpha: 1), "Прекрасно"),
        (UIColor(red: 255/255, green: 255/255, blue: 51/255, alpha: 1), "Отлично"),
        (UIColor(red: 0/255, green: 255/255, blue: 0/255, alpha: 1), "Хорошо"),
        (UIColor(red: 0/255, green: 255/255, blue: 255/255, alpha: 1), "Нормально"),
        (UIColor(red: 0/255, green: 128/255, blue: 255/255, alpha: 1), "Так себе"),
        (UIColor(red: 127/255, green: 0/255, blue: 255/255, alpha: 1), "Плохо"),
        (UIColor(red: 255/255, green: 0/255, blue: 255/255, alpha: 1), "Хуёво"),
        (UIColor(red: 128/255, green: 128/255, blue: 128/255, alpha: 1), "Пиздец")
    ]

    public static func getMoodInfo(moodIndex: Int) -> (UIColor, String)? {
        if moodColors.indices.contains(moodIndex) {
            return moodColors[moodIndex]
        }
        return nil
    }
}
