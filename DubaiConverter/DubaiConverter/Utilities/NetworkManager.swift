//
//  NetworkManager.swift
//  DubaiConverter
//
//  Created by Francesco Micheli on 15/09/2023.
//

import Foundation
import Alamofire

class NetworkManager: ObservableObject {
    
    var isPresented: Bool = false
    
    func apiRequest(url: String, completion: @escaping (Currency) -> ()) {
        Session.default.request(url).responseDecodable(of: Currency.self) { response in
            switch response.result {
            case .success(let currencies):
                completion(currencies)
            case .failure(let error):
                print(error)
                self.isPresented = true
            }
        }
    }
    
}
