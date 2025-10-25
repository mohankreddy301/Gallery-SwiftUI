//
//  GetPostAPIData.swift
//  Gallery-SwiftUI
//
//  Created by JM_Reddy on 25/10/25.
//

import Foundation

enum GetMediaData: APIRequirements {
    case getPosts
    case getVideos
    case getCollections
    
    var endpoint: String {
        switch self {
        case .getPosts:
            return  EndPoints.version1.rawValue + EndPoints.seach.rawValue
        case .getVideos:
            return EndPoints.videos.rawValue + EndPoints.seach.rawValue
        case .getCollections:
            return  EndPoints.version1.rawValue + EndPoints.collections.rawValue + EndPoints.featured.rawValue
        }
    }
    
    var baseURL: String {
        BaseURLS.pexels.rawValue
    }
    
    var headers: [String : String] {[APIHeaders.authorization.rawValue:ClientID.pexels.rawValue]}
    var queryItems: [URLQueryItem]? {
        switch self {
        case .getCollections:
            return nil
        default:
            return [URLQueryItem(name: "query", value: "people")]
        }
    }
}
