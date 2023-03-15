//
//  HomeViewModel.swift
//  SwiftCrypto
//
//  Created by Hakan Gül on 15.03.2023.
//

import Foundation
import Combine
/// TODO: ObservableObject nedir bakılacak?
class HomeViewModel : ObservableObject {
    
    @Published var allCoins: [CoinModel] = []
    @Published var portfolioCoins : [CoinModel] = []
    
    private let dataService = CoinDataService()
    private var cancellabes = Set<AnyCancellable>()
    
    
    init() {
        addSubscribers()
    }
    
    func addSubscribers(){
        dataService.$allCoins
            .sink { [weak self] (returnedCoins) in
                self?.allCoins = returnedCoins
            }
            .store(in: &cancellabes)
    }
}
