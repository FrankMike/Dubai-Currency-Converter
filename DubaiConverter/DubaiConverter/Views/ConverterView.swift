//
//  ContentView.swift
//  DubaiConverter
//
//  Created by Francesco Micheli on 15/09/2023.
//

import SwiftUI


struct ConverterView: View {
    
    @FocusState private var inputIsFocused: Bool
    @StateObject private var viewModel = ConverterViewMOdel()
    
    var body: some View {
        NavigationView {
            VStack {
                List {
                    ForEach(viewModel.currencyList, id:\.self) { currency in
                        Text(currency)
                            .padding()
                    }
                }
                Spacer()
                VStack {
                    TextField("Enter amount", text: $viewModel.input)
                        .padding()
                        .accentColor(.secondary)
                        .cornerRadius(10)
                        .padding()
                        .keyboardType(.decimalPad)
                        .focused($inputIsFocused)
                    Picker("Currencies", selection: $viewModel.selectedCurrency) {
                        Text("AED").tag(AvailableCurrencies.aed)
                        Text("EUR").tag(AvailableCurrencies.eur)
                        Text("USD").tag(AvailableCurrencies.usd)
                        Text("KZT").tag(AvailableCurrencies.kzt)
                    }
                    .padding()
                    .accentColor(.black)
                    .cornerRadius(10)
                    .padding()
                    .focused($inputIsFocused)
                    
                    Button {
                        viewModel.makeRequest()
                        viewModel.input = ""
                        inputIsFocused = false
                    } label: {
                        Text("Convert!")
                            .padding()
                    }
                    .padding()
                    .buttonStyle(.borderedProminent)
                    .accentColor(.black)
                }
            }
            .navigationTitle("💵 💶 Dubai Converter")
            .onAppear() {
                viewModel.makeRequest()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ConverterView()
    }
}
