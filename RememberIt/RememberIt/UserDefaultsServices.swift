//
//  UserDefaultsServices.swift
//  RememberIt
//
//  Created by Julianny Favinha on 06/10/19.
//  Copyright © 2019 Julianny Favinha. All rights reserved.
//

import Foundation



final class UserDefaultsServices {
    let defaults: UserDefaults

    init(defaults: UserDefaults = UserDefaults.standard) {
        self.defaults = defaults
    }

    func add(day: Int, month: Month) {
        let days = getDays(for: month)
        var newDays = days + [day]

        newDays.sort()
        defaults.set(newDays, forKey: month.rawValue)
    }

    func remove(day: Int, month: Month) {
        let days = getDays(for: month)
        var newDays = days.filter { $0 != day }

        newDays.sort()
        defaults.set(newDays, forKey: month.rawValue)
    }

    func getDays(for month: Month) -> [Int] {
        return defaults.value(forKey: month.rawValue) as? [Int] ?? []
    }
}
