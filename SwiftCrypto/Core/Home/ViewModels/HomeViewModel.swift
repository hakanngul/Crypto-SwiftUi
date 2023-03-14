//
//  HomeViewModel.swift
//  SwiftCrypto
//
//  Created by Hakan Gül on 15.03.2023.
//

import Foundation
/// TODO: ObservableObject nedir bakılacak?
class HomeViewModel : ObservableObject {
    
    @Published var allCoins: [CoinModel] = []
    @Published var portfolioCoins : [CoinModel] = []
    
    init() {
        DispatchQueue.main
            .asyncAfter(deadline: .now() + 2.0) {
                self.allCoins.append(DeveloperPreview.instance.coin)
                self.portfolioCoins.append(DeveloperPreview.instance.coin)
            }
    }
    
}
