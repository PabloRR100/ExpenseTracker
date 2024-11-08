//
//  Transaction.swift
//  ExpenseTracker
//
//  Created by Pablo Ruiz on 8/11/24.
//


import Foundation


struct Transaction: Identifiable, Decodable {
    let id: Int
    let date: String
    let institution: String
    let account: String
    var merchang: String
    let amount: Double
    let type: TransactionType.RawValue
    var categoryId: Int
    var category: String
    var isPending: Bool
    var isTransfer: Bool
    var isExpense: Bool
    var isEdited: Bool
    
    var dateParsed: Date {
        date.dateParsed()
    }
    
    // Check if it is a credit or a debit
    var signedAmount: Double {
        return type == TransactionType.credit.rawValue ? amount : -amount
    }
}


enum TransactionType: String {
    case debit = "debit"
    case credit = "credit"
}
