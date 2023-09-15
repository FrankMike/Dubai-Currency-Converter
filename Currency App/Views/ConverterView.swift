//
//  ContentView.swift
//  Currency App
//
//  Created by Federico on 04/11/2021.
//

import SwiftUI
import Alamofire

struct ConverterView: View {
    @Environment(\.colorScheme) var colorScheme
    @State var currencyList = [String]()
    @State var input = ""
    @FocusState private var inputIsFocused: Bool
    
    enum Currencies: String, CaseIterable, Identifiable {
        case eur, aed, usd, kzt
        var id: Self { self }
    }
    
    @State private var selectedCurrency: Currencies = .aed
    
    func makeRequest(currencies: [String] = ["AED", "EUR", "USD", "KZT"]) {
        apiRequest(url: "https://api.exchangerate.host/latest?base=\(selectedCurrency)&amount=\(input)") { currency in
            //print("ContentView", currency.rates)
            var tempList = [String]()
            for currency in currency.rates {
                if currencies.contains(currency.key)  {
                    tempList.append("\(currency.key) \(String(format: "%.2f",currency.value))")
                }
                tempList.sort()
            }
            currencyList.self = tempList
            
        }
    }
    
    var body: some View {
        ZStack {
            VStack {
                TitleView()
                List {
                    ForEach(currencyList, id: \.self) { currency in
                        Text(currency)
                            .padding()
                    }
                }
                VStack {
                    TextField("Enter amount" ,text: $input)
                        .padding()
                        .background(Color.secondary.opacity(0.25))
                        .cornerRadius(20.0)
                        .padding()
                        .keyboardType(.decimalPad)
                        .focused($inputIsFocused)
                    
                    Picker("Currencies", selection: $selectedCurrency) {
                        Text("AED").tag(Currencies.aed)
                        Text("EUR").tag(Currencies.eur)
                        Text("USD").tag(Currencies.usd)
                        Text("KZT").tag(Currencies.kzt)
                    }
                    .padding()
                    .background(colorScheme == .dark ? Color.white : Color.black)
                    .tint(colorScheme == .dark ? Color.black : Color.white)
                    .cornerRadius(20.0)
                    .padding()
                    .focused($inputIsFocused)
                    
                    Button("Convert!") {
                        makeRequest()
                        inputIsFocused = true
                        input = ""
                        inputIsFocused = false
                    }
                    .padding()
                    .buttonStyle(.borderedProminent)
                    .foregroundColor(colorScheme == .dark ? Color.black : Color.white)
                    .tint(colorScheme == .dark ? Color.white : Color.black)
                }
            }
            .background()
            .onAppear() {
                makeRequest()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ConverterView()
        
        ConverterView()
            .environment(\.colorScheme, .dark)
    }
}
