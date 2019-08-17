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

    private var moodHistoryData: [[String: Any]] {
        let moodStatistics = UserDefaults.standard.array(forKey: Constants.moodStatisticsStorageKey) as? [[String: Any]]
        return moodStatistics ?? []
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return moodHistoryData.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "moodListTableCell", for: indexPath)

        if moodHistoryData.indices.contains(indexPath.row) {
            let moodMeasurement = moodHistoryData[indexPath.row]
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = Constants.moodListDateFormat
            dateFormatter.locale = Locale.init(identifier: "ru_RU")

            if
                let moodIndex = moodMeasurement["mood"] as? Int,
                let moodInfo = MoodPresenter.getMoodInfo(moodIndex: moodIndex),
                let moodDate = moodMeasurement["at"] as? Date
            {

                let (color, moodText) = moodInfo
                cell.backgroundColor = color
                cell.textLabel!.text = "\(moodText) (\(dateFormatter.string(from: moodDate)))"
            }

        }
        return cell
    }
}
