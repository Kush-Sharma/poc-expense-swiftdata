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
        VStack(alignment: .leading, spacing: 8) {
            Label(expense.name, systemImage: "doc.text.fill")
                .font(.title3)
                .foregroundStyle(.primary)
            HStack {
                Text(expense.timestamp, format: .dateTime.year().month().day())
                    .frame(alignment: .leading)
                    .foregroundColor(.secondary)
                    .font(.headline)
                Spacer()
                Text(expense.value, format: .currency(code: "NZD"))
                    .font(.headline)
            }
        }
        .padding()
    }
}

#Preview {
    ExpenseCell(expense: Expense(name: "Test Expense", timestamp: .now, value: 3987.93))
}
