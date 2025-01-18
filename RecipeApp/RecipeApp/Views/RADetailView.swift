//
//  RADetailView.swift
//  RecipeApp
//
//  Created by Sakshi Shrivastava on 1/15/25.
//

import SwiftUI
import AVKit

struct RADetailView: View {
    
    @State var recipe: Recipe
    @State var player = AVPlayer()
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        NavigationStack {
            VStack {
                VStack {
                    if let videoURL = recipe.youtubeUrl {
                    
                        RAVideoPlayerView(videoUrl: videoURL)
                        
                    } else {
                        RAUrlImageView(url: URL(string: recipe.photoUrlLarge))
                        .scaledToFit()
                        .frame(maxHeight: 130)
                        .clipShape(Circle())
                        .padding(10)
                    }
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .background(.ultraThinMaterial)
                .cornerRadius(15)
                .padding()
            }
            .navigationBarItems(trailing: Image(systemName: "xmark.circle.fill").onTapGesture {
                dismiss()
            })
            .padding()
        }
    }
}

#Preview {
    RADetailView(recipe: Recipe(cuisine: "Malaysian", name: "Apam Balik", photoUrlLarge: "https://d3jbb8n5wk0qxi.cloudfront.net/photos/b9ab0071-b281-4bee-b361-ec340d405320/large.jpg", photoUrlSmall: "https://d3jbb8n5wk0qxi.cloudfront.net/photos/b9ab0071-b281-4bee-b361-ec340d405320/small.jpg", sourceUrl: "0c6ca6e7-e32a-4053-b824-1dbf749910d8", uuid: "https://www.nyonyacooking.com/recipes/apam-balik~SJ5WuvsDf9WQ", youtubeUrl: "https://www.youtube.com/watch?v=6R8ffRRJcrg"))
}
