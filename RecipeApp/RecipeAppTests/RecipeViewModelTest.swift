//
//  RecipeViewModelTest.swift
//  RecipeAppTests
//
//  Created by Dewashish Shah on 1/17/25.
//

import XCTest

final class RecipeViewModelTest: XCTestCase {
    
    @MainActor func test_happyPath_getRecipies() async{
        // Arrange
        let recipeVM = RecipeViewModel()
        
        // Act
        await recipeVM.getRecipes()
        
        // Assert
        XCTAssertFalse(recipeVM.errorFound)
    }
    
    @MainActor func test_malformedJSON_getRecipies() async {
        // Arrange
        let recipeVM = RecipeViewModel()
        recipeVM.baseURL = "https://d3jbb8n5wk0qxi.cloudfront.net/recipes-malformed.json"
        
        // Act
        await recipeVM.getRecipes()
        
        // Assert
        XCTAssertTrue(recipeVM.errorFound)
        XCTAssertTrue(recipeVM.recipes.isEmpty)
    }
    
    @MainActor func test_emptyJSON_getRecipies() async {
        // Arrange
        let recipeVM = RecipeViewModel()
        recipeVM.baseURL = "https://d3jbb8n5wk0qxi.cloudfront.net/recipes-empty.json"
        
        // Act
        await recipeVM.getRecipes()
        
        // Assert
        XCTAssertTrue(recipeVM.errorFound)
        XCTAssertTrue(recipeVM.recipes.isEmpty)
    }

    @MainActor func test_emptyUrl_getRecipies() async {
        // Arrange
        let recipeVM = RecipeViewModel()
        recipeVM.baseURL = ""
        
        // Act
        await recipeVM.getRecipes()
        
        // Assert
        XCTAssertTrue(recipeVM.errorFound)
        XCTAssertTrue(recipeVM.recipes.isEmpty)
    }
}
