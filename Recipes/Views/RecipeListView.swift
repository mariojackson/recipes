//
//  RecipeListView.swift
//  Recipes
//
//  Created by Mario Jackson on 11/15/21.
//

import SwiftUI

struct RecipeListView: View {
    
   @ObservedObject var model = RecipeViewModel()
    
    var body: some View {
        NavigationView {
            List(model.recipes) { recipe in
                NavigationLink(
                    destination: RecipeDetailView(recipe: recipe),
                    label: {
                        HStack(spacing: 20.0) {
                            Image(recipe.image)
                                .resizable()
                                .scaledToFill()
                                .frame(width: 50, height: 50, alignment: .center)
                                .clipped()
                                .cornerRadius(5)
                            Text(recipe.name)
                        }
                })
            }
            .navigationBarTitle("All Recipes")
        }
    }
}

struct RecipeListView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeListView()
    }
}
