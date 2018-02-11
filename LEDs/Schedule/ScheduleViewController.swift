//
//  ScheduleViewController.swift
//  LEDs
//
//  Created by Dominik Kapusta on 11/02/2018.
//  Copyright © 2018 Thick Mug. All rights reserved.
//

import UIKit

class ScheduleViewController: UITableViewController {

    @IBOutlet private weak var startDateLabel: UILabel!
    @IBOutlet private weak var startDatePickerCell: UITableViewCell!
    @IBOutlet private weak var startDatePicker: UIDatePicker!
    
    @IBOutlet private weak var endDateLabel: UILabel!
    @IBOutlet private weak var endDatePickerCell: UITableViewCell!
    @IBOutlet private weak var endDatePicker: UIDatePicker!
    
    private var _startDate: Date = Date()
    var startDate: Date {
        get {
            return _startDate
        }
        set {
            _startDate = newValue
            if isViewLoaded {
                startDatePicker.date = newValue
    //            startDateLabel.text = DateFormatter.shortUTC.string(from: newValue)
            }
        }
    }
    
    private var _endDate: Date = Date()
    var endDate: Date {
        get {
            return _endDate
        }
        set {
            _endDate = newValue
            if isViewLoaded {
                endDatePicker.date = newValue
//                endDateLabel.text = DateFormatter.shortUTC.string(from: newValue)
            }
        }
    }
    
    static let minDateSpan: Int = 7
    @IBAction private func datePickerDidChange(_ datePicker: UIDatePicker) {
//
//        var lastDateInDays = (datePicker.maximumDate! as NSDate).daysSince1970()
//        var firstDateInDays = (datePicker.minimumDate! as NSDate).daysSince1970()
//
//        if datePicker == startDatePicker {
//
//            var date = datePicker.date
//            var dateInDays = (date as NSDate).daysSince1970()
//            lastDateInDays = (endDate as NSDate).daysSince1970()
//
//            if dateInDays + CustomPeriodViewController.minDateSpan >= lastDateInDays {
//                dateInDays = lastDateInDays - CustomPeriodViewController.minDateSpan
//                repeat {
//                    dateInDays -= 1
//                } while !historyDates.contains(NSNumber(integerLiteral: dateInDays))
//
//                date = NSDate(daysSince1970: dateInDays) as Date
//                datePicker.date = date
//
//            } else if !historyDates.contains(NSNumber(integerLiteral: dateInDays)) {
//
//                var goingUp = startDate < datePicker.date
//                while !historyDates.contains(NSNumber(integerLiteral: dateInDays)) {
//                    if dateInDays > lastDateInDays {
//                        goingUp = false
//                    } else if dateInDays < firstDateInDays {
//                        goingUp = true
//                    }
//
//                    dateInDays += goingUp ? 1 : -1
//                }
//                date = NSDate(daysSince1970: dateInDays) as Date
//                datePicker.date = date
//            }
//
//            _startDate = date
//            startDateLabel.text = DateFormatter.shortUTC.string(from: date)
//
//        } else if datePicker == endDatePicker {
//
//            var date = datePicker.date
//            var dateInDays = (date as NSDate).daysSince1970()
//            firstDateInDays = (startDate as NSDate).daysSince1970()
//
//            if dateInDays - CustomPeriodViewController.minDateSpan <= firstDateInDays {
//                dateInDays = firstDateInDays + CustomPeriodViewController.minDateSpan
//                repeat {
//                    dateInDays += 1
//                } while !historyDates.contains(NSNumber(integerLiteral: dateInDays))
//
//                date = NSDate(daysSince1970: dateInDays) as Date
//                datePicker.date = date
//
//            } else if !historyDates.contains(NSNumber(integerLiteral: dateInDays)) {
//
//                var goingUp = endDate < datePicker.date
//                while !historyDates.contains(NSNumber(integerLiteral: dateInDays)) {
//                    if dateInDays > lastDateInDays {
//                        goingUp = false
//                    } else if dateInDays < firstDateInDays {
//                        goingUp = true
//                    }
//
//                    dateInDays += goingUp ? 1 : -1
//                }
//                date = NSDate(daysSince1970: dateInDays) as Date
//                datePicker.date = date
//            }
//
//            _endDate = date
//            endDateLabel.text = DateFormatter.shortUTC.string(from: date)
//        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.tableFooterView = UIView()
        
        startDatePicker.timeZone = TimeZone(identifier: "UTC")
        endDatePicker.timeZone = TimeZone(identifier: "UTC")
        
//        startDatePicker.minimumDate = NSDate(daysSince1970: historyDates.first!.intValue) as Date
//        startDatePicker.maximumDate = NSDate(daysSince1970: historyDates.last!.intValue) as Date
//        endDatePicker.minimumDate = NSDate(daysSince1970: historyDates.first!.intValue) as Date
//        endDatePicker.maximumDate = NSDate(daysSince1970: historyDates.last!.intValue) as Date
//
//        startDatePicker.date = startDate
//        startDateLabel.text = DateFormatter.shortUTC.string(from: startDate)
//        endDatePicker.date = endDate
//        endDateLabel.text = DateFormatter.shortUTC.string(from: endDate)
    }
    
    private enum DatePickerRow: Int {
        case none = -1, start = 1, end = 3
    }
    
    private var visibleDatePicker: DatePickerRow = .none
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        switch indexPath.row {
        case DatePickerRow.start.rawValue - 1:
            visibleDatePicker = visibleDatePicker == .start ? .none : .start
        case DatePickerRow.end.rawValue - 1:
            visibleDatePicker = visibleDatePicker == .end ? .none : .end
        default:
            break
        }
        tableView.beginUpdates()
        tableView.endUpdates()
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.row {
        case DatePickerRow.start.rawValue:
            if visibleDatePicker != .start {
                return 0
            }
        case DatePickerRow.end.rawValue:
            if visibleDatePicker != .end {
                return 0
            }
        default:
            break
        }
        return super.tableView(tableView, heightForRowAt: indexPath)
    }
}
