//
//  Expense.swift
//  ChiqimKirim
//
//  Created by Waris Ruzi on 2022/11/03.
//

import SwiftUI

// MARK: Expense Model And Sample Data

struct Expense: Identifiable,Hashable {
    var id = UUID().uuidString
    var remark: String
    var amount: Double
    var date: Date
    var type: ExpenseType
    var color: String
}

enum ExpenseType: String {
    case income = "كىرىم"
    case expense = "چىقىم"
    case all = "بارلىق"
}

var sample_expenses: [Expense] = [
    Expense(remark: "سومكا" , amount: 79, date: Date(timeIntervalSince1970: 1652987245), type: .expense, color: "Yellow"),
    Expense(remark: "قەھۋە ماشىنىسى", amount: 250, date: Date(timeIntervalSince1970: 1652987245), type: .expense, color: "Red"),
    Expense(remark: "كىتاپ", amount: 17, date: Date(timeIntervalSince1970: 1652987245), type: .expense, color: "Yellow"),
    Expense(remark: "ئېلان", amount: 200, date: Date(timeIntervalSince1970: 1652987245), type: .income, color: "Green"),
//    Expense(remark: "قاتناش", amount: 50, date: Date(timeIntervalSince1970: 1652987245), type: .expense, color: "Yellow"),
//    Expense(remark: "ئەپ", amount: 99, date: Date(timeIntervalSince1970: 1652987245), type: .expense, color: "Purple"),
//    Expense(remark: "ساياھەت", amount: 500, date: Date(timeIntervalSince1970: 1652987245), type: .expense, color: "Red"),
//    Expense(remark: "تۇرمۇش", amount: 700, date: Date(timeIntervalSince1970: 1652987245), type: .expense, color: "Green"),
//    Expense(remark: "ئوقۇش", amount: 1000, date: Date(timeIntervalSince1970: 1652987245), type: .expense, color: "Green"),
//    Expense(remark: "قەلەم", amount: 4, date: Date(timeIntervalSince1970: 1652987245), type: .expense, color: "Purple"),
//    Expense(remark: "قەھۋە ئۇرۇقى", amount: 40, date: Date(timeIntervalSince1970: 1652987245), type: .expense, color: "Yellow"),
    Expense(remark: "ئېكران", amount: 599, date: Date(timeIntervalSince1970: 1652987245), type: .expense, color: "Green"),
    Expense(remark: "پايچەك", amount: 5000, date: Date(timeIntervalSince1970: 1652987245), type: .income, color: "Green"),
    Expense(remark: "ئامازون", amount: 2500, date: Date(timeIntervalSince1970: 1652987245), type: .income, color: "Green"),
]

