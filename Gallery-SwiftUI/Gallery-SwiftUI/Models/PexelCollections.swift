//
//  PexelCollections.swift
//  Gallery-SwiftUI
//
//  Created by JM_Reddy on 25/10/25.
//

import Foundation

struct PexelCollections:Codable, Identifiable {
    var id: UUID?
    var page: Int?
    var per_page: Int?
    var total_results: Int?
    var next_page: String?
    var collections: [Collections]?
}

struct Collections:Codable,Identifiable {
    var id: String?
    var title: String?
    var description: String?
    var isPrivate: Bool?
    var mediaCount: Int?
    var photosCount: Int?
    var videosCount: Int?
    
    enum CodingKeys: String, CodingKey {
        case id
        case title
        case description
        case isPrivate = "private"
        case mediaCount = "media_count"
        case photosCount = "photos_count"
        case videosCount = "videos_count"
    }
    
    init(from decoder: any Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try container.decodeIfPresent(String.self, forKey: .id)
        self.title = try container.decodeIfPresent(String.self, forKey: .title)
        self.description = try container.decodeIfPresent(String.self, forKey: .description)
        self.isPrivate = try container.decodeIfPresent(Bool.self, forKey: .isPrivate)
        self.mediaCount = try container.decodeIfPresent(Int.self, forKey: .mediaCount)
        self.photosCount = try container.decodeIfPresent(Int.self, forKey: .photosCount)
        self.videosCount = try container.decodeIfPresent(Int.self, forKey: .videosCount)
    }
}

