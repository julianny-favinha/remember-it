//
//  DateServices.swift
//  RememberIt
//
//  Created by Julianny Favinha on 06/10/19.
//  Copyright © 2019 Julianny Favinha. All rights reserved.
//

import Foundation

final class DateServices {
    func getDaysInMonth(_ month: Int) -> Int {
        let dateComponents = DateComponents(year: 2019, month: month)
        let calendar = Calendar.current

        guard let date = calendar.date(from: dateComponents),
            let range = calendar.range(of: .day, in: .month, for: date) else {
            return 0
        }
        
        return range.count
    }

    func getMonth() -> Month {
        let month = Calendar.current.component(.month, from: Date())

        if month == 1 {
            return Month.january
        } else if month == 2 {
            return Month.february
        } else if month == 3 {
            return Month.march
        } else if month == 4 {
            return Month.april
        } else if month == 5 {
            return Month.may
        } else if month == 6 {
            return Month.june
        } else if month == 7 {
            return Month.july
        } else if month == 8 {
            return Month.august
        } else if month == 9 {
            return Month.september
        } else if month == 10 {
            return Month.october
        } else if month == 11 {
            return Month.november
        } else if month == 12 {
            return Month.december
        } else {
            return Month.none
        }
    }
}
