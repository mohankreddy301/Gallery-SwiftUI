//
//  GalleryPostViewModel.swift
//  Gallery-SwiftUI
//
//  Created by JM_Reddy on 25/10/25.
//

import Foundation

@Observable final class GalleryPostViewModel {
    
    var pexelVideo: PexelVideos?
    var pexelImage: PexelImage?
    var pexelCollection: PexelCollections?
    
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
            pexelImage = try await apiClient.fetch(requirements: GetMediaData.getPosts)
            await fetchVideos()
        } catch {
            self.error = error.localizedDescription
            print(error.localizedDescription)
        }
        isLoading = false
    }
    
    func fetchVideos() async  {
        isLoading = true
        error = nil
        do {
            pexelVideo = try await apiClient.fetch(requirements: GetMediaData.getVideos)
            await fetchCollection()
        } catch {
            self.error = error.localizedDescription
            print(error.localizedDescription)
        }
        isLoading = false
    }
    
    func fetchCollection() async  {
        isLoading = true
        error = nil
        do {
            pexelCollection = try await apiClient.fetch(requirements: GetMediaData.getCollections)
        } catch {
            self.error = error.localizedDescription
            print(error.localizedDescription)
        }
        isLoading = false
    }
}
