//
//  Model.swift
//  DubaiConverter
//
//  Created by Francesco Micheli on 15/09/2023.
//

import Foundation

struct Currency: Codable {
    var success: Bool
    var base: String
    var date: String
    var rates = [String: Double]()
}

enum AvailableCurrencies: String, CaseIterable, Identifiable {
    case eur, aed, usd, kzt
    var id: Self { self }
}
