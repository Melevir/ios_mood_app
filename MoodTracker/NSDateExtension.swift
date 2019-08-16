import Foundation

extension NSDate {
    convenience
    init(dateString: String) {
        let dateStringFormatter = DateFormatter()
        dateStringFormatter.dateFormat = "yyyy-MM-dd"
        dateStringFormatter.locale = NSLocale(localeIdentifier: "en_US_POSIX") as Locale
        self.init(timeInterval: 0, since: dateStringFormatter.date(from: dateString)!)
    }
}
