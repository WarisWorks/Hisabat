//
//  ExpenseCard.swift
//  ChiqimKirim
//
//  Created by Waris Ruzi on 2022/11/03.
//

import SwiftUI

struct ExpenseCard: View {
    @EnvironmentObject var expenseViewModel: ExpenseViewModel
    var isFilter: Bool = false
    var body: some View {
        GeometryReader{ proxy in
            RoundedRectangle(cornerRadius: 20, style: .continuous)
                .fill(
                    .linearGradient(colors: [
                        Color("Gradient1"),
                        Color("Gradient2"),
                        Color("Gradient3"),
                    ], startPoint: .topLeading, endPoint: .bottomTrailing)
                )
            
            VStack(spacing: 15) {
                VStack(spacing: 15){
                    //MARK: Currently Going Month Date String
                    Text(isFilter ? expenseViewModel.convertDateToString() : expenseViewModel.currentMonthDateString())
                        .font(.callout)
                        .fontWeight(.semibold)
                    
                    //MARK: Current Month Expenses Price
                    Text(expenseViewModel.convertExpenseToCurrency(expenses: expenseViewModel.expenses))
                        .font(.system(size: 35, weight: .bold))
                        .lineLimit(4)
                        .padding(.bottom,5)
                }
                .offset(y: -10)
                
                HStack(spacing: 15) {
                    VStack(alignment: .trailing, spacing: 4) {
                        Text("كىرىم")
                            .font(.custom(Uyghur, size: 16))
                            .opacity(0.7)
                        
                        Text(expenseViewModel.convertExpenseToCurrency(expenses: expenseViewModel.expenses, type: .income))
                            .font(.callout)
                            .fontWeight(.semibold)
                            .lineLimit(1)
                            .fixedSize()
                    }
                    
                    Image(systemName: "arrow.down")
                        .font(.caption.bold())
                        .foregroundColor(Color("Green"))
                        .frame(width: 30, height: 30)
                        .background(.white.opacity(0.7),in: Circle())
                    
                    
                    VStack(alignment: .trailing, spacing: 4) {
                        Text("چىقىم")
                            .font(.custom(Uyghur, size: 16))
                            .opacity(0.7)
                        
                        Text(expenseViewModel.convertExpenseToCurrency(expenses: expenseViewModel.expenses, type: .expense))
                            .font(.callout)
                            .fontWeight(.semibold)
                            .lineLimit(1)
                            .fixedSize()
                    }
                    .frame(maxWidth: .infinity, alignment: .trailing)
                    
                    
                    Image(systemName: "arrow.up")
                        .font(.caption.bold())
                        .foregroundColor(Color("Green"))
                        .frame(width: 30, height: 30)
                        .background(.white.opacity(0.7),in: Circle())
                    
                }
                .padding(.horizontal)
                .padding(.leading)
                .offset(y: 15)
                
            }
            .foregroundColor(.white)
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
        }
        .frame(height: 220)
        .padding(.top)
    }
}


