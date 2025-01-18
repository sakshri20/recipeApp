//
//  ImageLoader.swift
//  RecipeApp
//
//  Created by Sakshi Shrivastava on 1/16/25.
//

import Foundation
import UIKit

@MainActor
class RAImageLoader: ObservableObject {
    
    @Published var uiImage: UIImage?
    private static let cache = NSCache<NSString, UIImage>()
    
    func fetchImage(_ url: URL?) async throws {
        
        guard let imageUrl = url else {
            throw RAError.invalidURL
        }
        
        let request = URLRequest(url: imageUrl)
        
        // Check if image is present in the cache
        if let cachedImage = Self.cache.object(forKey: imageUrl.absoluteString as NSString) {
            uiImage = cachedImage
        } else {
            let (data, response) = try await URLSession.shared.data(for: request)
            
            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                throw RAError.invalidRequest
            }
            
            guard let image = UIImage(data: data) else {
                throw RAError.invalidData
            }
            
            // Store image in cache
            Self.cache.setObject(image, forKey: imageUrl.absoluteString as NSString)
            
            uiImage = image
        }
    }
}
