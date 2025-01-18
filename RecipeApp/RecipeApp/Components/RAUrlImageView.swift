//
//  RAUrlImageView.swift
//  RecipeApp
//
//  Created by Sakshi Shrivastava on 1/16/25.
//

import SwiftUI

struct RAUrlImageView: View {
    
    let url: URL?
    @StateObject private var imageLoader = RAImageLoader()
    
    var body: some View {
        VStack {
            if let uiImage = imageLoader.uiImage {
                Image(uiImage: uiImage)
                    .resizable()
                    .scaledToFit()
                    .frame(maxWidth: .infinity, maxHeight: 200)
            } else {
                ProgressView("Loading...")
            }
        }.task {
            await downloadImage()
        }
    }
    
    private func downloadImage() async {
        do {
            try await imageLoader.fetchImage(url)
        } catch {
            print(error)
        }
    }
}

#Preview {
    RAUrlImageView(url: URL(string:"https://d3jbb8n5wk0qxi.cloudfront.net/photos/b9ab0071-b281-4bee-b361-ec340d405320/small.jpg"))
}
