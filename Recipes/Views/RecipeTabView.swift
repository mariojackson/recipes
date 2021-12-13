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
            RecipeFeaturedView()
                .tabItem {
                    Label("Featured", systemImage: "star.fill")
                }
            
            RecipeListView()
                .tabItem {
                    Label("Recipes", systemImage: "list.bullet")
                }
        }
        .environmentObject(RecipeViewModel())
    }
}

struct RecipeTabView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeTabView()
    }
}
