//
//  FilteredDetailView.swift
//  ChiqimKirim
//
//  Created by Waris Ruzi on 2022/11/03.
//

import SwiftUI

struct FilteredDetailView: View {
    @EnvironmentObject var expenseViewModel: ExpenseViewModel
    //MARK: Environment Values
    @Environment(\.self) var env
    @Namespace var animation
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack(spacing: 15){
                HStack(spacing: 15){
                 
                        //MARK: Setting Bar
                    Button {
                        expenseViewModel.showFilterView = true
                    } label: {
                        Image(systemName: "slider.horizontal.3")
                            .foregroundColor(.gray)
                            .frame(width: 40, height: 40)
                            .background(Color.white, in: RoundedRectangle(cornerRadius: 10, style: .continuous))
                            .shadow(color: .black.opacity(0.1), radius: 5, x: 5, y: 5)
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
                            Text("كىرىم-چىقىم")
                                .font(.custom(UyghurTom, size: 20))
                                .opacity(0.7)
                                .frame(maxWidth: .infinity, alignment: .trailing)
                        }
                        .frame(maxWidth: .infinity,alignment: .leading)

                    //MARK: Back Button
                    Button {
                        env.dismiss()
                    } label: {
                        Image(systemName: "arrow.right.circle.fill")
                            .foregroundColor(.gray)
                            .frame(width: 40, height: 40)
                            .background(Color.white, in: RoundedRectangle(cornerRadius: 10, style: .continuous))
                            .shadow(color: .black.opacity(0.1), radius: 5, x: 5, y: 5)
                            .overlay(content: {
                                Circle()
                                    .stroke(.white, lineWidth: 2)
                                    .padding(7)
                            })
                            .frame(width: 40, height: 40)
                            .background(Color.white, in: RoundedRectangle(cornerRadius: 10, style: .continuous))
                            .shadow(color: .black.opacity(0.1), radius: 5, x: 5, y: 5)
                    }
                }
                
                //MARK: Expense Card View For Currently Selected Date
                ExpenseCard(isFilter: true)
                    .environmentObject(expenseViewModel)
                CustomSegmentedControl()
                    .padding(.top)
                
                //MARK: Currently Filtered Date With Amount
                VStack(spacing: 15){
                    Text(expenseViewModel.convertDateToString())
                        .opacity(0.7)
                    
                    Text(expenseViewModel.convertExpenseToCurrency(expenses: expenseViewModel.expenses, type: expenseViewModel.tabName))
                        .font(.title.bold())
                        .opacity(0.9)
                        .animation(.none, value: expenseViewModel.tabName)
                }
                .padding()
                .frame(maxWidth: .infinity)
                .background{
                    RoundedRectangle(cornerRadius: 15, style: .continuous)
                        .fill(.white)
                }
                .padding(.vertical,20)
                
                ForEach(expenseViewModel.expenses.filter {
                    return $0.type == expenseViewModel.tabName
                }){ expense in
                    TransactionCardView(expense: expense)
                        .environmentObject(expenseViewModel)
                    
                }
            }
            .padding()
        }
        .navigationBarHidden(true)
        .background{
            Color("BG")
                .ignoresSafeArea()
        }
        .overlay{
            FilterView()
        }
    }
    
    //MARK: Filter View
    @ViewBuilder
    func FilterView()->some View{
        ZStack{
            Color.black
                .opacity(expenseViewModel.showFilterView ? 0.25 : 0)
                .ignoresSafeArea()
            
            //MARK: Based On the Date Filter Expenses Array
            
            if expenseViewModel.showFilterView{
                VStack(alignment: .trailing, spacing: 10) {
                    Text("باشلانغان ۋاقتى")
                        .font(.custom(Uyghur, size: 18))
                        .opacity(0.7)
                    
                    DatePicker("",selection: $expenseViewModel.startDate,in: Date.distantPast...Date(),displayedComponents: [.date])
                        .labelsHidden()
                        .datePickerStyle(.compact)
                    
                    Text("ئاخىرلاشقان ۋاقتى")
                        .font(.custom(Uyghur, size: 18))
                        .opacity(0.7)
                        .padding(.top,10)
                    
                    DatePicker("",selection: $expenseViewModel.endDate,in: Date.distantPast...Date(),displayedComponents: [.date])
                        .labelsHidden()
                        .datePickerStyle(.compact)
                }
                .padding(20)
                .background{
                    RoundedRectangle(cornerRadius: 10, style: .continuous)
                        .fill(.white)
                }
                //MARK: Close Button
                .overlay(alignment: .topLeading, content: {
                    Button {
                        expenseViewModel.showFilterView = false
                    } label: {
                        Image(systemName: "xmark.circle.fill")
                            .font(.title3)
                            .foregroundColor(.black)
                            .padding(5)
                    }

                })
                .padding()
            }
        }
        .animation(.easeInOut, value: expenseViewModel.showFilterView)
    }
    
    //MARK: Custom Segmented Control
    @ViewBuilder
    func CustomSegmentedControl()->some View{
        HStack(spacing: 0) {
            ForEach([ExpenseType.income,ExpenseType.expense], id: \.rawValue){tab in
                Text(tab.rawValue.capitalized)
                    .font(.custom(UyghurTom, size: 18))
                    .foregroundColor(expenseViewModel.tabName == tab ? .white : .black)
                    .opacity(expenseViewModel.tabName == tab ? 1 : 0.7)
                    .padding(.vertical, 12)
                    .frame(maxWidth: .infinity)
                    .background{
                        //MARK: With Matched Geometry Effect
                        if expenseViewModel.tabName == tab{
                            RoundedRectangle(cornerRadius: 10, style: .continuous)
                                .fill(
                                    LinearGradient(colors:
                                                    [
                                                        Color("Gradient3"),
                                                        Color("Gradient1"),
                                                        Color("Gradient2"),
                                                    ]
                                                   , startPoint: .topLeading, endPoint: .bottomTrailing)
                                )
                                .matchedGeometryEffect(id: "TAB", in: animation)
                        }
                    }
                    .contentShape(Rectangle())
                    .onTapGesture {
                        withAnimation {
                            expenseViewModel.tabName = tab
                        }
                    }
            }
        }
        .padding(5)
        .background{
            RoundedRectangle(cornerRadius: 10, style: .continuous)
                .fill(.white)
        }
    }
}

struct FilteredDetailView_Previews: PreviewProvider {
    static var previews: some View {
        FilteredDetailView()
            .environmentObject(ExpenseViewModel())
    }
}
