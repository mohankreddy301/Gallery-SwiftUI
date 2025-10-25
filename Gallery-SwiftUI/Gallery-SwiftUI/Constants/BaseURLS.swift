//
//  BaseURLS.swift
//  Gallery-SwiftUI
//
//  Created by JM_Reddy on 25/10/25.
//

import Foundation

enum BaseURLS: String {
   case pexels = "https://api.pexels.com/"
}

enum ClientID: String {
    case pexels = ""
}

enum EndPoints: String {
    case version1 = "v1/"
    case seach = "search"
    case videos = "videos/"
    case collections = "collections/"
    case featured = "featured"
}
