//
//  ConverterViewModel.swift
//  DubaiConverter
//
//  Created by Francesco Micheli on 15/09/2023.
//

import Foundation

class ConverterViewMOdel: ObservableObject {
    @Published var currencyList = [String]()
    @Published var input = ""
    
    private var networkManager = NetworkManager()
    
    var selectedCurrency: AvailableCurrencies = .aed
    
    func makeRequest(currencies: [String] = ["AED", "EUR", "USD", "KZT"], api_key: String) {
        networkManager.apiRequest(url: "http://api.exchangerate.host/live?access_key=\(api_key)") { currency in
            var tempList = [String]()
            for currency in currency.rates {
                if currencies.contains(currency.key)  {
                    tempList.append("\(currency.key) \(String(format: "%.2f",currency.value))")
                }
                tempList.sort()
            }
            self.currencyList = tempList
            print(self.currencyList)
        }
    }
    
    func makeRequestOld(currencies: [String] = ["AED", "EUR", "USD", "KZT"]) {
        networkManager.apiRequest(url: "https://api.exchangerate.host/latest?base=\(selectedCurrency)&amount=\(input)") { currency in
            var tempList = [String]()
            for currency in currency.rates {
                if currencies.contains(currency.key)  {
                    tempList.append("\(currency.key) \(String(format: "%.2f",currency.value))")
                }
                tempList.sort()
            }
            self.currencyList = tempList
            print(self.currencyList)
        }
    }
}

