//
//  LuciferAPI_Helper.swift
//  Assignment1
//
//  Created by Babita Rawat on 2023-09-25.
//

import Foundation
enum LuciferApiErrors: Error {
    case unableToConvertUrl
    case Invalid_URL
}

class LuciferAPI_Helper{
    
    static let urlString = "https://lucifer-quotes.vercel.app/api/quotes"
    
    static func fetchQuoteData() async throws -> Any {
        guard
            let url = URL(string: urlString)
        else { throw LuciferApiErrors.unableToConvertUrl }
        
        let (data, _) = try await
            URLSession.shared.data(from: url)
        
        let jsonObject = try JSONSerialization.jsonObject(with: data, options: [])
        
        return jsonObject
    }
    
}
