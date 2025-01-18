//
//  Recipe.swift
//  RecipeApp
//
//  Created by Sakshi Shrivastava on 1/13/25.
//

import Foundation

struct Recipe: Identifiable, Codable {
    var cuisine: String
    var name: String
    var photoUrlLarge: String
    var photoUrlSmall: String
    var sourceUrl: String?
    var uuid: String
    var youtubeUrl: String?
    var id: String{uuid}
}

struct RecipeData: Codable {
    var recipes: [String: [Recipe]]
}

enum RAError: Error {
    case invalidURL, invalidResponse, invalidRequest, invalidData
}

struct RecipesService {
    
    func getRecipesFromServer(url: String) async throws -> [Recipe] {
        
        guard let ulr = URL(string: url) else {
            throw RAError.invalidURL
        }
        
        let (data, response) = try await URLSession.shared.data(from: ulr)
        
        guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
            throw RAError.invalidResponse
        }
        
        do {
            let decoder = JSONDecoder()
            decoder.keyDecodingStrategy = .convertFromSnakeCase
            let resps = try decoder.decode([String: [Recipe]].self, from: data)
            return resps["recipes"]!
        } catch {
            throw RAError.invalidData
        }
    }
}
