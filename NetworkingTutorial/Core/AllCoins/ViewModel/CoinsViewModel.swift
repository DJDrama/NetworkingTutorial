//
//  CoinsViewModel.swift
//  NetworkingTutorial
//
//  Created by Dongjun Lee on 3/18/24.
//

import Foundation

class CoinsViewModel: ObservableObject {
    @Published var coins = [Coin]()
    @Published var errorMessage: String?
    private let service = CoinDataService()
    
    init() {
        Task {
            try await fetchCoins()
        }
    }
    
    func fetchCoins() async throws{
        let fetchedCoins = try await service.fetchCoins()
//        DispatchQueue.main.async {
//            self.coins = fetchedCoins
//        }
        // or
        await MainActor.run {
            // coins will be updated on the Main Thread
            self.coins = fetchedCoins
        }
    }
    
    func fetchCoinsWithCompletionHandler(){
        service.fetchCoinsWithResult { [weak self] result in
            DispatchQueue.main.async{
                switch result {
                case .success(let coins):
                    self?.coins = coins
                case .failure(let error):
                    self?.errorMessage  = error.localizedDescription
                }
            }
        }
    }
    
    
}
