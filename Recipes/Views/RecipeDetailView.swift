//
//  RecipeDetailView.swift
//  Recipes
//
//  Created by Mario Jackson on 11/18/21.
//

import SwiftUI

struct RecipeDetailView: View {
    var recipe: Recipe
    @State var selectedServingSize = 2
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                // MARK: Recipe Image
                Image(recipe.image)
                    .resizable()
                    .scaledToFill()
                
                // MARK: Serving Size Picker
                VStack (alignment: .leading) {
                    Text("Select your serving size")
                        .font(.title3)
                    Picker("", selection: $selectedServingSize) {
                        Text("2").tag(2)
                        Text("4").tag(4)
                        Text("6").tag(6)
                        Text("8").tag(8)
                    }
                    .pickerStyle(SegmentedPickerStyle())
                    .frame(width: 160)
                }
                .padding()
                
                // MARK: Ingredients
                VStack(alignment: .leading) {
                    Text("Ingredients")
                        .font(.headline)
                        .padding(.top, 20)
                        .padding(.bottom, 10)
                    
                    ForEach(recipe.ingredients) { ingredient in
                        let portion = RecipeViewModel.getPortion(ingredient: ingredient, recipeServings: recipe.servings, targetServingSize: selectedServingSize)
                        
                        Text(portion + " " + ingredient.name)
                            .padding(.bottom, 3)
                    }
                }.padding(.horizontal)
                
                // MARK: Directions
                VStack(alignment: .leading) {
                    Text("Directions")
                        .font(.headline)
                        .padding(.top, 20)
                        .padding(.bottom, 10)
                    
                    ForEach(0..<recipe.directions.count, id: \.self) { index in
                        Text(String(index+1) + ". " + recipe.directions[index])
                            .padding(.bottom, 3)
                    }
                }.padding(.horizontal)
            }
        }
        .navigationBarTitle(recipe.name)
    }
}

struct RecipeDetailView_Previews: PreviewProvider {
    static var previews: some View {
        let model = RecipeViewModel()
        
        RecipeDetailView(recipe: model.recipes[0])
    }
}
