//
//  ViewController.swift
//  MoodTracker
//
//  Created by Ilya Lebedev on 11/08/2019.
//  Copyright © 2019 Ilya Lebedev. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    private var currentColorIndex = 4

    @IBOutlet weak var moodSelector: MoodSelectorView!
    @IBOutlet weak var moodLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()

        let swipeDown = UISwipeGestureRecognizer(target: self, action: Selector(("swipeDownAction:")))
        swipeDown.direction = .down
        self.view.addGestureRecognizer(swipeDown)

        let swipeUp = UISwipeGestureRecognizer(target: self, action: Selector(("swipeUpAction:")))
        swipeUp.direction = .up
        self.view.addGestureRecognizer(swipeUp)

        updateMoodWith(index: currentColorIndex)
    }

    @IBAction func saveButtonClick(_ sender: UIButton) {
        let now = Date()
        print("Saving \(currentColorIndex) at \(now)")
    }

    @objc private func swipeDownAction(_ sender: UIGestureRecognizer) {
        updateMoodWith(index: currentColorIndex + 1)
    }

    @objc private func swipeUpAction(_ sender: UIGestureRecognizer) {
        updateMoodWith(index: currentColorIndex - 1)
    }
    private func updateMoodWith(index: Int) {
        if let moodInfo = MoodPresenter.getMoodInfo(moodIndex: index) {
            let (color, moodText) = moodInfo
            moodSelector.redrawWith(color: color)
            moodLabel.text = moodText
            currentColorIndex = index
        }
    }
}
