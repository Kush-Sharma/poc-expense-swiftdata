//
//  poc_expense_swiftdataTests.swift
//  poc-expense-swiftdataTests
//
//  Created by Kush Sharma on 11/06/2025.
//

import Testing
import Foundation
@testable import poc_expense_swiftdata

@Suite()
struct ExpenseTests {
    let expenses = Expense.mockData()
    
    /// #require will fail - Can unwrap optional values, and stop the test when `nil`
    // let expeses: [Expense] = []
    
    @Suite("Expense Data",
           .tags(.critical))
    struct ExpenseData {
        let expenses = Expense.mockData()
        
        @Test("Check expense value")
        @available(iOS 18, *)
        func expenseValue() async throws {
            let expectedValue = 2500.87
            
            let exppense = try #require(expenses.first)
            #expect(exppense.value == expectedValue)
        }
        
        @Test("Check expense name",
              .timeLimit(.minutes(1)),
              arguments: ["Test", "Test1", "Test2", "Test3", "Test4", "Test5"])
        func expenseName(expanseName: String) async throws {
            let expectedName = expanseName
            
            let expense = try #require(expenses.first(where: { $0.name == expectedName }))
            #expect(expense.name == expectedName)
        }
        
        @Test("Check expense timestamp",
              .enabled(if: 1 > 0))
        func expenseTimestamp() async throws {
            let expectedValue = Date.from(year: 2024, month: 1, day: 1)
            
            let exppense = try #require(expenses.first)
            #expect(exppense.timestamp == expectedValue)
        }
    }
    
    @Test("Check expense date",
          .disabled("This test is disabled until the bug is fixed."),
          .bug("https://bugTicketURL", "Date not being used correctly"),
          .tags(.nonCritical))
    func expenseDate() async throws {
        let expectedValue = Date.from(year: 2024, month: 1, day: 1)
        
        let expense = try #require(expenses.first)
        #expect(expense.timestamp == expectedValue)
    }
}


extension Tag {
    @Tag static var critical: Self
    @Tag static var nonCritical: Self
}
