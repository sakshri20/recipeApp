//
//  RecipeViewModel.swift
//  RecipeApp
//
//  Created by Sakshi Shrivastava on 1/13/25.
//

import Foundation

@MainActor
class RecipeViewModel: ObservableObject {
    @Published var recipes: [Recipe] = []
    @Published var errorMessage = ""
    @Published var errorFound = false
    var baseURL: String = "https://d3jbb8n5wk0qxi.cloudfront.net/recipes.json"
    
    func getRecipes() async {
        guard let data = try? await RecipesService().getRecipesFromServer(url: baseURL), !data.isEmpty else {
            self.recipes = []
            self.errorMessage = "Something went wrong! \n Please try again later."
            self.errorFound = true
            return
        }
        
        self.recipes = data
    }
}
