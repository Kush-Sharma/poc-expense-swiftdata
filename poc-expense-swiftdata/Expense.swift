//
//  Expense.swift
//  poc-expense-swiftdata
//
//  Created by Kush Sharma on 22/04/2024.
//

import Foundation
import SwiftData

@Model
final class Expense: Hashable, Identifiable {
    var id = UUID()
    var name: String
    @Attribute(.unique) var timestamp: Date
    var value: Double
    
    init(name: String, timestamp: Date, value: Double) {
        self.name = name
        self.timestamp = timestamp
        self.value = value
    }
}

extension Expense {
    static func mockData() -> [Expense] {
        return [Expense(name: "Test", timestamp: Date.from(year: 2024, month: 1, day: 1), value: 2500.87),
                Expense(name: "Test1", timestamp: Date.from(year: 2024, month: 2, day: 1), value: 7960.87),
                Expense(name: "Test2", timestamp: Date.from(year: 2024, month: 3, day: 1), value: 5000.87),
                Expense(name: "Test3", timestamp: Date.from(year: 2024, month: 4, day: 1), value: 2960.87),
                Expense(name: "Test4", timestamp: Date.from(year: 2024, month: 5, day: 1), value: 9000.87),
                Expense(name: "Test5", timestamp: Date.from(year: 2024, month: 6, day: 1), value: 3500.87)]
    }
}
