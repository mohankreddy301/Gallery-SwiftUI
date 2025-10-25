//
//  NetworkErrors.swift
//  Gallery-SwiftUI
//
//  Created by JM_Reddy on 25/10/25.
//

import Foundation

enum NetworkErrors: Error {
    case invalidURL
    case decodingFailed(Error)
    case invalidResponse
    case noData
    case urlSessionFailed(Error)
}

