//
//  ContentView.swift
//  RecipeApp
//
//  Created by Sakshi Shrivastava on 1/7/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationStack{
            VStack {
                Image(systemName: "fork.knife.circle.fill")
                    .font(.largeTitle)
                    .imageScale(.large)
                    .foregroundStyle(.tint)
                Text("Recipe App!")
            }
            .padding()
        }
    }
}

#Preview {
    ContentView()
}
