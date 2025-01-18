//
//  VideoPlayerView.swift
//  RecipeApp
//
//  Created by Sakshi Shrivastava on 1/16/25.
//

import SwiftUI
import WebKit

struct RAVideoPlayerView: UIViewRepresentable {
    
    @State var videoUrl: String
    
    func makeUIView(context: Context) ->  WKWebView {
        return WKWebView()
    }
    
    func updateUIView(_ uiView: WKWebView, context: Context) {
        
        guard let url = URL(string: videoUrl ) else { return }
        
        uiView.scrollView.isScrollEnabled = false
        uiView.load(URLRequest(url: url))
    }
}


