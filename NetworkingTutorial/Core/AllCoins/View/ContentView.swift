//
//  ContentView.swift
//  NetworkingTutorial
//
//  Created by Dongjun Lee on 3/18/24.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @StateObject var viewModel = CoinsViewModel()
    var body: some View {
        List {
            ForEach(viewModel.coins) { coin in
                HStack(spacing: 12){
                    Text("\(coin.marketCapRank)")
                        .foregroundColor(.gray)
                    
                    VStack(alignment: .leading, spacing: 4){
                        Text("\(coin.name)")
                            .fontWeight(.semibold)
                        Text("\(coin.symbol.uppercased())")
                    }
                    
                }
                .font(.footnote)
            }
        }
        .overlay {
            if let error = viewModel.errorMessage {
                Text(error)
            }
        }
    }
}

#Preview {
    ContentView()
}
