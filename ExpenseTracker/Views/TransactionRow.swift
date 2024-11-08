//
//  TransactionRow.swift
//  ExpenseTracker
//
//  Created by Pablo Ruiz on 8/11/24.
//

import SwiftUI
import SwiftUIFontIcon


struct TransactionRow: View {
    var transaction: Transaction
    
    var body: some View  {
        HStack(spacing: 20) {
            
            // MARK: Icon
            RoundedRectangle(cornerRadius: 20, style: .continuous)
                .fill(Color.icon.opacity(0.3))
                .frame(width: 44, height: 44)
                .overlay {
                    FontIcon.text(.awesome5Solid(code: .icons), fontsize: 24, color: Color.icon)
                }
            
            VStack(alignment: .leading, spacing: 6) {
                
                // MARK: Merchat
                Text(transaction.merchang)
                    .font(.subheadline)
                    .bold()
                    .lineLimit(1)
                
                // MARK: Category
                Text(transaction.category)
                    .font(.footnote)
                    .opacity(0.7)
                    .lineLimit(1)
                
                // MARK: Date
                // Extract default date format -> extend DateFormatter for this
                Text(transaction.dateParsed, format: .dateTime.year().month().day())
                    .font(.footnote)
                    .foregroundColor(.secondary)
            
            }
            
            Spacer()
            
            // MARL: Amount
            Text(transaction.signedAmount, format: .currency(code: "EUR"))
                .bold()
                .foregroundColor(transaction.type == TransactionType.credit.rawValue ? Color.text: .primary)
            
        }
        .padding([.top, .bottom], 8)
    }
}


#Preview("Ligth Preview") {
    TransactionRow(transaction: transactionPreviewData)
        .preferredColorScheme(.light)
}

#Preview("Dark Preview") {
    TransactionRow(transaction: transactionPreviewData)
        .preferredColorScheme(.dark)
}


//// Old syntax
//struct TransactionRow_Previews: PreviewProvider {
//    static var previews: some View {
//        Group {
//            TransactionRow(transaction: transactionPreviewData)
//            TransactionRow(transaction: transactionPreviewData)
//        }
//    }
//}
