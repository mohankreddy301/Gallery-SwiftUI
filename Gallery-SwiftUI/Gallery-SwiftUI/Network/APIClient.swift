//
//  APIClient.swift
//  Gallery-SwiftUI
//
//  Created by JM_Reddy on 25/10/25.
//

import Foundation

struct APIClient {
    
    func fetch<T:Decodable>(requirements: APIRequirements) async throws -> T? {
        guard !requirements.baseURL.isEmpty,
                var urlComponents =  URLComponents(string: requirements.baseURL) else {
            throw NetworkErrors.invalidURL
        }
        urlComponents.path += "\(requirements.endpoint)"
        
        if let queryItems = requirements.queryItems {
            urlComponents.queryItems = queryItems
        }
        
        guard let url = urlComponents.url else {
            throw NetworkErrors.invalidURL
        }
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = requirements.method.rawValue
        urlRequest.allHTTPHeaderFields = requirements.headers
        
        do {
            let (data, response) = try await URLSession.shared.data(for: urlRequest)
            guard let httpResponse = response as? HTTPURLResponse,
                  (200...299).contains(httpResponse.statusCode) else {
                throw NetworkErrors.invalidResponse
            }
            return try JSONDecoder().decode(T.self, from: data)
        } catch {
            throw NetworkErrors.urlSessionFailed(error)
        }
    }
}
