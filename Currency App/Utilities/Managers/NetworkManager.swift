//
//  NetworkManager.swift
//  Currency App
//
//  Created by Francesco Micheli on 15/09/2023.
//

import UIKit
import Alamofire

final class NetworkManager {
    
    func apiRequest(url: String, completion: @escaping (CurrencyModel) -> ()) {
        
        Session.default.request(url).responseDecodable(of: CurrencyModel.self) { response in
            switch response.result {
            case .success(let currencies):
                print(currencies)
                completion(currencies)
            case .failure(let error):
                print(error)
            }
        }
    }
    
    static let shared = NetworkManager()
    
    
}


