//
//  Gallery_SwiftUIApp.swift
//  Gallery-SwiftUI
//
//  Created by JM_Reddy on 25/10/25.
//

import SwiftUI

@main
struct Gallery_SwiftUIApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView(galleryPostViewModel: GalleryPostViewModel(apiClient: APIClient()))
        }
    }
}
