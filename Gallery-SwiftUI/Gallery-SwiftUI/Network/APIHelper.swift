//
//  APIHelperProtocal.swift
//  Gallery-SwiftUI
//
//  Created by JM_Reddy on 25/10/25.
//

import Foundation

 protocol APIRequirements {
    var baseURL: String { get }
    var endpoint: String { get }
     var method: HTTPMethod { get set}
    var headers: [String: String] { get }
    var queryItems: [URLQueryItem]? { get }
}

extension APIRequirements {
    
    var method: HTTPMethod {
        get {.get}
        set {}
    }
    
    var queryItems: [URLQueryItem]? {
        get {nil}
        set {}
    }
}

enum HTTPMethod: String {
    case get = "GET"
    case post = "POST"
    case put = "PUT"
    case delete = "DELETE"
    case patch = "PATCH"
}
