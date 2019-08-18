//
//  ViewController.swift
//  MoodTracker
//
//  Created by Ilya Lebedev on 11/08/2019.
//  Copyright © 2019 Ilya Lebedev. All rights reserved.
//

import UIKit

class MoodSelectorViewController: UIViewController {
    private var currentColorIndex = 4

    @IBOutlet private weak var moodSelector: MoodSelectorView!
    @IBOutlet private weak var moodLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()

        let swipeDown = UISwipeGestureRecognizer(target: self, action: #selector(swipeDownAction(_:)))

        swipeDown.direction = .down
        self.view.addGestureRecognizer(swipeDown)

        let swipeUp = UISwipeGestureRecognizer(target: self, action: #selector(swipeUpAction(_:)))
        swipeUp.direction = .up
        self.view.addGestureRecognizer(swipeUp)

        moodLabel.adjustsFontSizeToFitWidth = true

        updateMoodWith(index: currentColorIndex)
    }

    @IBAction private func saveButtonClick(_ sender: UIButton) {
        let now = Date()
        let newMoodRecord: [String: Any] = ["mood": currentColorIndex, "at": now]

        let defaults = UserDefaults.standard

        var moodStatistics = defaults.array(forKey: Constants.moodStatisticsStorageKey)
        if moodStatistics == nil {
            moodStatistics = [newMoodRecord]
        } else {
            moodStatistics?.append(newMoodRecord)
        }
        defaults.set(moodStatistics, forKey: Constants.moodStatisticsStorageKey)
    }

    @objc
     private func swipeDownAction(_ sender: UIGestureRecognizer) {
        updateMoodWith(index: currentColorIndex + 1)
    }

    @objc
     private func swipeUpAction(_ sender: UIGestureRecognizer) {
        updateMoodWith(index: currentColorIndex - 1)
    }

    private func updateMoodWith(index: Int) {
        guard let moodInfo = MoodService.getMoodInfo(moodIndex: index) else {
            return
        }
        let (color, moodText) = moodInfo
        moodSelector.redrawWith(color: color)
        moodLabel.text = moodText
        currentColorIndex = index
    }
}
