//
//  ExpenseCell.swift
//  poc-expense-swiftdata
//
//  Created by Kush Sharma on 22/04/2024.
//

import SwiftUI

struct ExpenseCell: View {
    
    let expense: Expense
    
    var body: some View {
        HStack {
            Text(expense.timestamp, format: .dateTime.month(.abbreviated).day())
                .frame(width: 70, alignment: .leading)
            Text(expense.name)
            Spacer()
            Text(expense.value, format: .currency(code: "NZD"))
        }
        .padding()
    }
}

#Preview {
    ExpenseCell(expense: Expense(name: "Test Expense", timestamp: .now, value: 3987.93))
}
