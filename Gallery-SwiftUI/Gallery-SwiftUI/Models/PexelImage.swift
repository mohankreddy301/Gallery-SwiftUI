//
//  PexelImage.swift
//  Gallery-SwiftUI
//
//  Created by JM_Reddy on 25/10/25.
//

import Foundation

struct PexelImage:Codable, Identifiable {
    var id: UUID?
    var photos: [PostImage]?
    var page: Int?
    var total_results: Int?
    var next_page: String?
}

struct PostImage: Codable,Identifiable {
    
    var id: Int?
    var width: Int?
    var height: Int?
    var url: String?
    var photographer: String?
    var photographerUrl: String?
    var photographerId: Int?
    var avgColor: String?
    var liked: Bool?
    var alt:String?
    var src:PhotoSrc?
    
    enum CodingKeys: String, CodingKey {
        case photographerUrl = "photographer_url"
        case photographerId = "photographer_id"
        case avgColor = "avg_color"
        case liked = "liked"
        case alt = "alt"
        case src = "src"
    }
    
    init(from decoder: any Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.photographerUrl = try container.decodeIfPresent(String.self, forKey: .photographerUrl)
        self.photographerId = try container.decodeIfPresent(Int.self, forKey: .photographerId)
        self.avgColor = try container.decodeIfPresent(String.self, forKey: .avgColor)
        self.liked = try container.decodeIfPresent(Bool.self, forKey: .liked)
        self.alt = try container.decodeIfPresent(String.self, forKey: .alt)
        self.src = try container.decodeIfPresent(PhotoSrc.self, forKey: .src)
    }
}

struct PhotoSrc: Codable,Identifiable {
    var id:UUID?
    var original:String?
    var large2x:String?
    var large:String?
    var medium:String?
    var small:String?
    var portrait:String?
    var landscape:String?
    var tiny:String?
}

