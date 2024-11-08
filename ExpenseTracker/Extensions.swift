//
//  Extensions.swift
//  ExpenseTracker
//
//  Created by Pablo Ruiz on 8/11/24.
//

import Foundation
import SwiftUI


//extension Color {
//    // name of the colorSet in Assest
//    static let background = Color("Background")
//    static let icon = Color("Icon")
//    static let text = Color("Text")
//    static let systemBackground = Color(uiColor: .systemBackground)
//}


extension DateFormatter {
    static let allNumericUSA: DateFormatter = {
        print("Initializing DateFormatter")
        let formatter = DateFormatter()
        formatter.dateFormat = "dd/MM/yyyy"
        
        return formatter
    }()
}


extension String {
    func dateParsed() -> Date {
        // The guard statement simplifies error handling by providing an early exit if date parsing fails
        guard let parsedDate = DateFormatter.allNumericUSA.date(from: self) else {return Date() }
        return parsedDate
    }
}
