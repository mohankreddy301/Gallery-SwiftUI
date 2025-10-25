//
//  GalleryPostViewModel.swift
//  Gallery-SwiftUI
//
//  Created by JM_Reddy on 25/10/25.
//

import Foundation

@Observable final class GalleryPostViewModel {
    
    var posts: [PostImage] = []
    var galleryData: Gallery?
    var isLoading: Bool = false
    var error: String?
    private let apiClient: APIClient
    
    init(apiClient: APIClient = APIClient()) {
        self.apiClient = apiClient
    }
    
    
    func fetchImages() async  {
        isLoading = true
        error = nil
        do {
            galleryData = try await apiClient.fetch(requirements: GetPostAPIData.getPosts)
            print(galleryData)
        } catch {
            self.error = error.localizedDescription
            print(error.localizedDescription)
        }
        isLoading = false
    }
}
