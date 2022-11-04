//
//  Home.swift
//  ChiqimKirim
//
//  Created by Waris Ruzi on 2022/11/03.
//

import SwiftUI

struct Home: View {
    @StateObject var expenseViewModel: ExpenseViewModel = .init()
    var body: some View {
        ScrollView(.vertical, showsIndicators: false){
            VStack(spacing: 12){
                HStack(spacing: 15){
                    
                    NavigationLink{
                        FilteredDetailView()
                            .environmentObject(expenseViewModel)
                    } label: {
                        Image(systemName: "hexagon.fill")
                            .foregroundColor(.gray)
                            .overlay(content: {
                                Circle()
                                    .stroke(.white, lineWidth: 2)
                                    .padding(7)
                            })
                            .frame(width: 40, height: 40)
                            .background(Color.white, in: RoundedRectangle(cornerRadius: 10, style: .continuous))
                            .shadow(color: .black.opacity(0.1), radius: 5, x: 5, y: 5)
                        
                        
                    }
                    
                    
                    VStack(alignment: .trailing, spacing: 4){
                        Text("خۇش كەلدىڭىز")
                            .font(.custom(Uyghur, size: 18))
                            .foregroundColor(.gray)
                        
                        Text("خوجايىن")
                            .font(.custom(UyghurTom, size: 20))
                    }
                    .frame(maxWidth: .infinity,alignment: .trailing)
                    
                    
                }
                ExpenseCard()
                    .environmentObject(expenseViewModel)
                TransactionsView()
            }
            .padding()
        }
        .background{
            Color("BG")
                .ignoresSafeArea()
        }
        .fullScreenCover(isPresented: $expenseViewModel.addNewExpense) {
            expenseViewModel.clearData()
        } content: {
            NewExpense()
                .environmentObject(expenseViewModel)
        }
        .overlay(alignment: .bottomLeading){
            AddButton()
        }
        
    }
    //MARK: Add new expense button
    @ViewBuilder
    func AddButton()->some View{
        Button{
            expenseViewModel.addNewExpense.toggle()
        } label: {
            Image(systemName: "plus")
                .font(.system(size: 25, weight: .medium))
                .foregroundColor(.white)
                .frame(width: 55, height: 55)
                .background{
                    Circle()
                        .fill(
                            .linearGradient(colors: [
                                Color("Gradient3"),
                                Color("Gradient1"),
                                Color("Gradient2"),
                            ], startPoint: .topLeading, endPoint: .bottomTrailing)
                        
                        )
                }
                .shadow(color: .black.opacity(0.1), radius: 5, x: 5, y: 5)
        }
        .padding()
    }
    
    //MARK: Transactions View
    @ViewBuilder
    func TransactionsView()->some View{
        VStack{
            Text("سودا-سېتىق")
                .font(.custom(UyghurTom, size: 25))
                .opacity(0.7)
                .frame(maxWidth: .infinity, alignment: .trailing)
            
            ForEach(expenseViewModel.expenses){ expense in
                //MARK: Transaction Card View
                TransactionCardView(expense: expense)
                    .environmentObject(expenseViewModel)
            }
        }
        .padding(.top)
    }
    
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
