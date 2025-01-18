//
//  RAListView.swift
//  RecipeApp
//
//  Created by Sakshi Shrivastava on 1/10/25.
//

import SwiftUI
import SwiftData

struct RAListView: View {
    
    @StateObject var recipieVM = RecipeViewModel()
    @State var selectedRecipe: Recipe? = nil
    
    var body: some View {
        NavigationStack {
            if recipieVM.errorFound {
                Text(recipieVM.errorMessage)
                    .font(.title3)
                    .fontWeight(.bold)
                    .frame(alignment: .center)
            } else {
                List {
                    ForEach(recipieVM.recipes) { recipe in
                        
                        RARecipeCard(recipe: recipe)
                            .onTapGesture {
                                selectedRecipe = recipe
                            }
                        
                    }
                }
                .task {
                    await recipieVM.getRecipes()
                }
                .navigationTitle("Recipes")
                .fullScreenCover(item: $selectedRecipe, content: { recipe in
                    RADetailView(recipe: recipe)
                })
            }
        }
    }
}


#Preview {
    RAListView()
}
