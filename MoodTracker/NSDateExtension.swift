import Foundation

extension NSDate {
    convenience
    init(dateString: String) {
        let dateStringFormatter = DateFormatter()
        dateStringFormatter.dateFormat = "yyyy-MM-dd"
        dateStringFormatter.locale = NSLocale(localeIdentifier: "en_US_POSIX") as Locale
        if let date = dateStringFormatter.date(from: dateString) {
            self.init(timeInterval: 0, since: date)
        } else {
            self.init()
        }
    }
}
