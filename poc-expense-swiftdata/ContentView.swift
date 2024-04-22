//
//  ContentView.swift
//  poc-expense-swiftdata
//
//  Created by Kush Sharma on 22/04/2024.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @Environment(\.modelContext) private var modelContext
    @State private var isShowingExpenseSheet = false
    @State private var selectedExpense: Expense?
    
    @Query(filter: #Predicate<Expense> {$0.value >= 100}, sort: \Expense.timestamp)
    private var expenses: [Expense]
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(expenses) { expense in
                    ExpenseCell(expense: expense)
                        .onTapGesture {
                            selectedExpense = expense
                        }
                }
                .onDelete(perform: deleteItems)
            }
            .navigationTitle("Expenses")
            .navigationBarTitleDisplayMode(.automatic)
            .sheet(isPresented: $isShowingExpenseSheet) {AddExpenseSheet()}
            .sheet(item: $selectedExpense) { expense in
                UpdateExpenseSheet(expense: expense)
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    EditButton()
                }
                ToolbarItem {
                    Button("Add Item", systemImage: "plus") {
                        isShowingExpenseSheet = true
                    }
                }
            }
        }
        .overlay {
            if expenses.isEmpty {
                ContentUnavailableView(label: {
                    Label("No Expenses", systemImage: "note.text.badge.plus")
                }, description:{
                    Text("Start adding expenses to see your list.")
                }, actions: {
                    Button("Add Expense") { isShowingExpenseSheet = true }
                })
            }
        }
    }
    
    private func addItem() {
        withAnimation {
            let newExpense = Expense(name: "Test", timestamp: Date(), value: 396.87)
            modelContext.insert(newExpense)
        }
    }
    
    private func deleteItems(offsets: IndexSet) {
        withAnimation {
            for index in offsets {
                modelContext.delete(expenses[index])
            }
        }
    }
}

#Preview {
    ContentView()
        .modelContainer(for: Expense.self, inMemory: true)
}
