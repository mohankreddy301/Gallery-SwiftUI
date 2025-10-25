//
//  PexelVideos.swift
//  Gallery-SwiftUI
//
//  Created by JM_Reddy on 25/10/25.
//

import Foundation

struct PexelVideos: Codable,Identifiable {
    var id: UUID?
    var page: Int?
    var per_page: Int?
    var total_results: Int?
    var next_page: String?
    var videos:[Videos]?
}

struct Videos: Codable, Identifiable {
    var id:Int?
    var width:Int?
    var height:Int?
    var duration:Int?
    var tags:[String]?
    var url:String?
    var image:String?
    var user:VideoUser?
    var videoFiles:[VideoFiles]?
    var videoPictures:[VideoPictures]?
    
    enum CodingKeys: String, CodingKey {
        case id
        case width
        case height
        case duration
        case tags
        case url
        case image
        case user
        case videoFiles = "video_files"
        case videoPictures = "video_pictures"
    }
    
    init(from decoder: any Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try container.decodeIfPresent(Int.self, forKey: .id)
        self.width = try container.decodeIfPresent(Int.self, forKey: .width)
        self.height = try container.decodeIfPresent(Int.self, forKey: .height)
        self.duration = try container.decodeIfPresent(Int.self, forKey: .duration)
        self.tags = try container.decodeIfPresent([String].self, forKey: .tags)
        self.url = try container.decodeIfPresent(String.self, forKey: .url)
        self.image = try container.decodeIfPresent(String.self, forKey: .image)
        self.user = try container.decodeIfPresent(VideoUser.self, forKey: .user)
        self.videoFiles = try container.decodeIfPresent([VideoFiles].self, forKey: .videoFiles)
        self.videoPictures = try container.decodeIfPresent([VideoPictures].self, forKey: .videoPictures)
    }
}


struct VideoUser: Codable, Identifiable {
    var id: Int?
    var name: String?
    var url: String?
}

struct VideoFiles: Codable, Identifiable {
    var id: Int?
    var quality: String?
    var fileType: String?
    var link: String?
    var size: Int?
    var height: Int?
    var width: Int?
    
    enum CodingKeys: String, CodingKey {
        case id
        case quality
        case fileType = "file_type"
        case link
        case size
        case height
        case width
    }
    
}

struct VideoPictures: Codable, Identifiable {
    var id: Int?
    var nr: Int?
    var picture: String?
}
