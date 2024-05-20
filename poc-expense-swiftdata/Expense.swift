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
    let id = UUID()
    var name: String
    @Attribute(.unique) var timestamp: Date
    var value: Double
    
    init(name: String, timestamp: Date, value: Double) {
        self.name = name
        self.timestamp = timestamp
        self.value = value
    }
}
