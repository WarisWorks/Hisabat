//
//  TransactionCardView.swift
//  ChiqimKirim
//
//  Created by Waris Ruzi on 2022/11/03.
//

import SwiftUI

struct TransactionCardView: View {
    var expense: Expense
    @EnvironmentObject var expenseViewModel: ExpenseViewModel
    var body: some View {
        HStack(spacing: 12){
            
            VStack(alignment: .leading, spacing: 7) {
                //MARK: Display Price
                let price = expenseViewModel.convertNumberToPrice(value: expense.type == .expense ? -expense.amount : expense.amount)
                
                Text(price)
                    .font(.callout)
                    .opacity(0.7)
                    .foregroundColor(expense.type == .expense ? Color("Red")  : Color("Green"))
                Text(expense.date.formatted(date: .numeric, time: .omitted))
                    .font(.caption)
                    .opacity(0.5)
                    
            }
            
            //MARK: RTL
            Text(expense.remark)
                .font(.custom(UyghurTom, size: 20))
                .lineLimit(1)
                .frame(maxWidth: .infinity, alignment: .trailing)
            
            if let first = expense.remark.first{
                Text(String(first))
                    .font(.custom(UyghurTom, size: 25))
                    .foregroundColor(.white)
                    .frame(width: 50, height: 50)
                    .background{
                        Circle()
                            .fill(Color(expense.color))
                    }
                    .shadow(color: .black.opacity(0.08), radius: 5, x: 5, y: 5)
            }
            
           
            
        }
        .padding()
        .background{
            RoundedRectangle(cornerRadius: 15, style: .continuous)
                .fill(.white)
        }
        
    }
}

struct TransactionCardView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
