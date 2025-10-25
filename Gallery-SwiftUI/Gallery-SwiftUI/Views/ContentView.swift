//
//  ContentView.swift
//  Gallery-SwiftUI
//
//  Created by JM_Reddy on 25/10/25.
//

import SwiftUI

struct ContentView: View {
    private let apiClient = APIClient()
    @State private var viewModel: GalleryPostViewModel = GalleryPostViewModel()
    
    init(galleryPostViewModel: GalleryPostViewModel) {
        self.viewModel = GalleryPostViewModel(apiClient: apiClient)
    }
    
    var body: some View {
        NavigationStack {
            if viewModel.isLoading {
                ProgressView("Loading....")
            } else if let error = viewModel.error {
                Text("Error: \(error)").foregroundStyle(Color.red)
            }
        }.onAppear() {
            Task {
                await viewModel.fetchImages()
            }
            
        }
    }
}

#Preview {
    ContentView(galleryPostViewModel: GalleryPostViewModel(apiClient: APIClient()))
}
