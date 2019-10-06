//
//  ContentView.swift
//  RememberIt
//
//  Created by Julianny Favinha on 28/09/19.
//  Copyright © 2019 Julianny Favinha. All rights reserved.
//

import SwiftUI

struct DayView: View {
    let day: Int
    let month: Month

    let userDefaults = UserDefaultsServices()
    @State var isSelected = false

    var body: some View {
        ZStack {
            Circle()
                .foregroundColor(color(for: isSelected))

            Button(action: toggleButton) {
                Text("\(day == 0 ? "" : String(day))")
                    .font(.footnote)
                    .padding(5)
            }
        }
    }

    private func toggleButton() {
        if self.day != 0 {
            withAnimation {
                self.isSelected.toggle()

                updateUserDefaults(isSelected)
            }
        }
    }

    private func color(for isSelected: Bool) -> Color {
        return isSelected ? .green : .clear
    }

    private func updateUserDefaults(_ isSelected: Bool) {
        if isSelected {
            userDefaults.add(day: day, month: month)
        } else {
            userDefaults.remove(day: day, month: month)
        }
    }
}

struct CalendarView: View {
    let days: Int
    let month: Month
    let rows: Int

    let columns = 7
    let userDefaults = UserDefaultsServices()

    var body: some View {
        ForEach(0..<rows, id: \.self) { row in
            HStack() {
                ForEach(0..<self.columns, id: \.self) { column -> DayView in
                    let day = self.columns*row + column + 1

                    if day <= self.days {
                        return DayView(
                            day: self.columns*row + column + 1,
                            month: self.month,
                            isSelected: self.userDefaults.getDays(for: self.month).contains(self.columns*row + column + 1)
                        )
                    }

                    return DayView(day: 0, month: self.month, isSelected: false)
                }
            }
            .padding(EdgeInsets(top: 0, leading: 16, bottom: 16, trailing: 16))
        }
    }
}

struct MonthView: View {
    let data: MonthData

    let dateServices = DateServices()

    var body: some View {
        VStack {
            HStack {
                Text("\(data.month.rawValue.capitalized)")
                    .font(.headline)
                    .padding()

                Spacer()

                Text("2019")
                    .font(.footnote)
                    .foregroundColor(.secondary)
                    .padding()
            }

            CalendarView(
                days: dateServices.getDaysInMonth(data.number),
                month: data.month,
                rows: (dateServices.getDaysInMonth(data.number) % 7 == 0) ? dateServices.getDaysInMonth(data.number)/7 : dateServices.getDaysInMonth(data.number)/7 + 1
            )
        }
    }
}

struct ContentView: View {
    let months = [
//        MonthData(number: 1, month: .january),
//        MonthData(number: 2, month: .february),
//        MonthData(number: 3, month: .march),
//        MonthData(number: 4, month: .april),
//        MonthData(number: 5, month: .may),
//        MonthData(number: 6, month: .june),
//        MonthData(number: 7, month: .july),
//        MonthData(number: 8, month: .august),
        MonthData(number: 9, month: .september),
        MonthData(number: 10, month: .october),
        MonthData(number: 11, month: .november),
        MonthData(number: 12, month: .december)
    ]

    var body: some View {
        NavigationView {
            ScrollView {
                ForEach(0..<months.count) { index -> MonthView in
                    MonthView(data: self.months[index])
                }
            }
            .navigationBarTitle("Remember it")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
