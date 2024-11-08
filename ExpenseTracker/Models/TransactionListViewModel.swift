//
//  TransactionListViewModel.swift
//  ExpenseTracker
//
//  Created by Pablo Ruiz on 8/11/24.
//

import Foundation
import Combine


/*
 ObservableObject is a protocol in SwiftUI that allows a class to publish changes to its properties.
 When a class conforms to ObservableObject, it can use the @Published property wrapper on properties to automatically notify SwiftUI views of changes.
 
 SwiftUI’s views can observe an ObservableObject by declaring it with the @StateObject or @ObservedObject property wrapper.
 This makes the view automatically re-render whenever the ObservableObject changes.
 */
final class TransactionListViewModel: ObservableObject {
    /*
     Class designed to fetch a list of Transaction objects from a remote JSON file and make them available for SwiftUI views.
     */
    
    // Responsible to send events to the subscribers
    @Published var transactions: [Transaction] = []
    
    private var cancellables = Set<AnyCancellable>()
    
    init() {
        getTransactions()
    }
    
    func getTransactions() {
        guard let url = URL(string: "https://designcode.io/data/transactions.json") else {
            print("Invalid URL")
            return
        }
        
        // Initiates a data task using Combine’s dataTaskPublisher to fetch data asynchronously from the specified URL.
        URLSession.shared.dataTaskPublisher(for: url)
            .tryMap { (data, response) -> Data in
                guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
                    dump(response)
                    throw URLError(.badServerResponse)
                }
                // if no error, return data and decode it into a Data model
                return data
            }
            .decode(type: [Transaction].self, decoder: JSONDecoder())
            // Specifies that the following stages should be executed on the main thread, as UI updates in SwiftUI must occur on the main thread.
            .receive(on: DispatchQueue.main)
            // Handles both completion and successful data reception:
            .sink {completion in
                switch completion {
                case .failure(let error):
                    print("Error fetching transactions: ", error.localizedDescription)
                case .finished:
                    print("Finished fetching transactions")
                }
            } receiveValue: { [weak self] result in
                self?.transactions = result
            }
            .store(in: &cancellables)
    }

}
