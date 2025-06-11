//
//  ChartView.swift
//  poc-expense-swiftdata
//
//  Created by Kush Sharma on 05/05/2024.
//

import SwiftUI
import Charts

struct ChartView: View {
    
    let expenses: [Expense]
    
    var body: some View {
        VStack {
            Text("Expenses Trends")
                .font(.callout)
                .fontWeight(.bold)
                .foregroundStyle(.secondary)
            
            Text("Total: \(String(format: "%.2f", expenses.reduce(0, {$0 + $1.value })))")
                .fontWeight(.semibold)
                .font(.footnote)
                .foregroundStyle(.secondary)
                .padding(.bottom)
            
            Chart {
                RuleMark(y: .value("Limit", 4000))
                    .foregroundStyle(Color.mint)
                    .lineStyle(StrokeStyle(lineWidth: 1, dash: [5]))
                
                //Customisation to add a label on top of the RulerMark
                
                //                    .annotation(alignment: .leading) {
                //                        Text("Limit")
                //                            .font(.caption)
                //                            .foregroundColor(.secondary)
                //                    }
                
                
                ForEach(expenses) { expense in
                    BarMark(
                        x: .value("Month", expense.timestamp, unit: .month),
                        y: .value("Values", expense.value)
                    )
                    .foregroundStyle(.indigo.gradient)
                    .cornerRadius(5)
                    .annotation(alignment: .center) {
                        Text(expense.name)
                            .font(.caption2)
                            .foregroundColor(.secondary)
                            .dynamicTypeSize(.xSmall)
                        
                    }
                }
            }
            .frame(height: 240)
            .chartXAxis {
                AxisMarks {
                    //Customisation to add axis grid lines.
                    //AxisGridLine()
                    AxisTick()
                    AxisValueLabel(format: .dateTime.month())
                    
                }
            }
            .chartYAxis {
                AxisMarks(position: .trailing)
            }
            .padding(.bottom, 12)
            
            //Customisation to add axis limit, chart background or border.
            
            //.chartYScale(domain: 0...10000)
            //.chartXAxis(.hidden)
            //            .chartPlotStyle { plotContent in
            //                plotContent
            //                    .background(.purple.gradient.opacity(0.2))
            //                    .border(.secondary, width: 0.5)
            //            }
            
            
            HStack {
                Image(systemName: "line.diagonal")
                    .rotationEffect(Angle(degrees: 45))
                    .foregroundColor(.mint)
                
                Text("Limit")
                    .foregroundStyle(.secondary)
            }
            .font(.caption2)
            .padding(.leading, 4)
            
            
            
        }
        .padding()
    }
}

#Preview {
    ChartView(expenses: Expense.mockData())
}

extension Date {
    static func from(year: Int, month: Int, day: Int) -> Date {
        let components = DateComponents(year: year, month: month, day: day)
        return Calendar.current.date(from: components)!
    }
}
