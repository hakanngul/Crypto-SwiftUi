//
//  CoinDataService.swift
//  SwiftCrypto
//
//  Created by Hakan Gül on 15.03.2023.
//

import Foundation
import Combine



class CoinDataService {
    
    private var static_url : String = "https://api.coingecko.com/api/v3/coins/markets?vs_currency=usd&order=market_cap_desc&per_page=250&page=1&sparkline=true&price_change_percentage=24h"
    @Published var allCoins: [CoinModel] = []
    //var cancellables = Set<AnyCancellable>()
    
    var coinSubscription: AnyCancellable?
    
    init(){
        getCoins()
    }
    
    private func getCoins(){
        guard let url = URL(string: static_url) else { return }
        
        coinSubscription = NetworkingManager.download(url: url)
            .decode(type: [CoinModel].self, decoder: JSONDecoder())
            .sink(receiveCompletion: NetworkingManager.handleCompletion, receiveValue: {[weak self] (returnedCoins) in
                self?.allCoins = returnedCoins
                self?.coinSubscription?.cancel()
            })
            
    }
    
}
