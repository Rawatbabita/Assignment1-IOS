//
//  BreakingBadAPI_Helper.swift
//  Assignment1
//
//  Created by Babita Rawat on 2023-09-25.
//

import Foundation

enum BreakingBadApiErrors: Error {
    case unableToConvertUrl
    case Invalid_URL
}

class BreakingBad_Helper{
    
    static let urlString = "https://api.breakingbadquotes.xyz/v1/quotes/"
    
    static func fetchQuoteData() async throws -> Any {
        guard
            let url = URL(string: urlString)
        else { throw BreakingBadApiErrors.unableToConvertUrl }
        
        let (data, _) = try await
            URLSession.shared.data(from: url)
        
        let jsonObject = try JSONSerialization.jsonObject(with: data, options: [])
        
        return jsonObject
    }
    
}

