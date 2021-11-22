//
//  RecipeTabView.swift
//  Recipes
//
//  Created by Mario Jackson on 11/22/21.
//

import SwiftUI

struct RecipeTabView: View {
    var body: some View {
        TabView {
            Text("Featured View")
                .tabItem {
                    Label("Featured", systemImage: "star.fill")
                }
            
            RecipeListView()
                .tabItem {
                    Label("Recipes", systemImage: "list.bullet")
                }
        }
    }
}

struct RecipeTabView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeTabView()
    }
}
