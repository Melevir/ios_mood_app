//
//  MoodListViewController.swift
//  MoodTracker
//
//  Created by Ilya Lebedev on 16/08/2019.
//  Copyright © 2019 Ilya Lebedev. All rights reserved.
//

import UIKit

class MoodListViewController: UIViewController, UITableViewDataSource {
    @IBOutlet weak var moodList: UITableView!
    private let moodHistoryData = [
        (4, NSDate(dateString: "2019-04-01")),
        (5, NSDate(dateString: "2019-04-02")),
        (6, NSDate(dateString: "2019-04-03")),
        (4, NSDate(dateString: "2019-04-04"))
    ]

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return moodHistoryData.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "moodListTableCell", for: indexPath)

        if moodHistoryData.indices.contains(indexPath.row) {
            let (moodIndex, moodDate) = moodHistoryData[indexPath.row]
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "d MMM yyyy"
            dateFormatter.locale = Locale.init(identifier: "ru_RU")

            if let moodInfo = MoodPresenter.getMoodInfo(moodIndex: moodIndex) {
                let (color, moodText) = moodInfo
                cell.backgroundColor = color
                cell.textLabel!.text = "\(moodText) (\(dateFormatter.string(from: moodDate as Date)))"
            }

        }
        return cell
    }
}
