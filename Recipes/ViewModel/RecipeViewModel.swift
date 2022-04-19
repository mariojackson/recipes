//
//  RecipeViewModel.swift
//  Recipes
//
//  Created by Mario Jackson on 11/15/21.
//

import Foundation

class RecipeViewModel: ObservableObject {
    @Published var recipes = [Recipe]()
    
    init() {
        self.recipes = DataService().getLocalRecipeData()
    }
    
    static func getPortion(ingredient: Ingredient, recipeServings: Int, targetServingSize: Int) -> String {
        return String(targetServingSize)
    }
}
