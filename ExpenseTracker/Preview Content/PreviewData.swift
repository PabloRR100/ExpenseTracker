//
//  PreviewData.swift
//  ExpenseTracker
//
//  Created by Pablo Ruiz on 8/11/24.
//

/*
 This is used to create Mock data for the Previous.
 This code wont' make it to the production build
 */


import Foundation
import SwiftUI


var transactionPreviewData = Transaction(
    id: 1,
    date: "01/24/2024",
    institution: "Revolut",
    account: "Principal",
    merchang: "Apple",
    amount: 11.50,
    type: TransactionType.debit.rawValue,
    categoryId: 21,
    category: "Software",
    isPending: false,
    isTransfer: false,
    isExpense: true,
    isEdited: false
)


var transactionListPreviewData = [Transaction](repeating: transactionPreviewData, count: 10)

