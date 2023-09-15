//
//  Currency.swift
//  Currency App
//
//  Created by Federico on 04/11/2021.
//

import Foundation


struct CurrencyModel: Codable {
    var success: Bool
    var base: String
    var date: String
    var rates = [String: Double]()
}
