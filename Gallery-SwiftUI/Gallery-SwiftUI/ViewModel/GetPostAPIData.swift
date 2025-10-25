//
//  GetPostAPIData.swift
//  Gallery-SwiftUI
//
//  Created by JM_Reddy on 25/10/25.
//

import Foundation

enum GetPostAPIData: APIRequirements {
    case getPosts
    var endpoint: String {
        switch self {
        case .getPosts:
            return "search"
        }
       
    }
    var baseURL: String {BaseURLS.pexels.rawValue}
    var headers: [String : String] {[APIHeaders.authorization.rawValue:ClientID.pexels.rawValue]}
    var queryItems: [URLQueryItem]? {
       return [URLQueryItem(name: "query", value: "people")]
    }
    
}
