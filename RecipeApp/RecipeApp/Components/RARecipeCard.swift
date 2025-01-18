//
//  RecipeCard.swift
//  RecipeApp
//
//  Created by Sakshi Shrivastava on 1/15/25.
//

import SwiftUI

struct RARecipeCard: View {
    
    @State var recipe: Recipe
    
    var body: some View {
        VStack (alignment: .leading) {
            VStack {
                RAUrlImageView(url: URL(string: recipe.photoUrlSmall))
                .scaledToFit()
                // .frame(maxHeight: 130)
                .clipShape(Circle())
                .padding(5)
            }
            .frame(maxWidth: .infinity, maxHeight: 200)
            .background(.ultraThinMaterial)
            .cornerRadius(15)
            
            VStack (alignment: .leading, spacing: 7) {
                Text(recipe.cuisine)
                    .font(.headline)
                    .foregroundColor(.gray)
                    .lineLimit(2)
                
                Text(recipe.name)
                    .font(.title3)
                    .fontWeight(.bold)
            }
        }
        .padding()
        
        
    }
}

#Preview {
    RARecipeCard(recipe: Recipe(cuisine: "Malaysian", name: "Apam Balik", photoUrlLarge: "https://d3jbb8n5wk0qxi.cloudfront.net/photos/b9ab0071-b281-4bee-b361-ec340d405320/large.jpg", photoUrlSmall: "https://d3jbb8n5wk0qxi.cloudfront.net/photos/b9ab0071-b281-4bee-b361-ec340d405320/small.jpg", sourceUrl: "0c6ca6e7-e32a-4053-b824-1dbf749910d8", uuid: "https://www.nyonyacooking.com/recipes/apam-balik~SJ5WuvsDf9WQ", youtubeUrl: "https://www.youtube.com/watch?v=6R8ffRRJcrg"))
}
