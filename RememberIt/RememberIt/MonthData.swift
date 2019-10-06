//
//  MonthData.swift
//  RememberIt
//
//  Created by Julianny Favinha on 06/10/19.
//  Copyright © 2019 Julianny Favinha. All rights reserved.
//

import Foundation

enum Month: String {
    case january
    case february
    case march
    case april
    case may
    case june
    case july
    case august
    case september
    case october
    case november
    case december
    case none
}

struct MonthData: Identifiable {
    var id = UUID()
    let number: Int
    let month: Month
}
