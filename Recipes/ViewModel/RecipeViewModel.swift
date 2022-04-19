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
        var portion = ""
        var numerator = ingredient.num ?? 1
        var denominator = ingredient.denom ?? 1
        var wholePortion = 0
        
        if ingredient.num != nil {
            denominator *= recipeServings
            
            // Get target portion by multiplying numerator by target servings
            numerator *= targetServingSize
            
            // Reduce fraction by greatest common divisor
            let greatestCommonDivisor = Rational.greatestCommonDivisor(numerator, denominator)
            numerator = numerator / greatestCommonDivisor
            denominator = denominator / greatestCommonDivisor
            
            // Get the whole portion if numerator > denominator
            if numerator >= denominator {
                
                // Calculate the whole portions
                wholePortion = numerator / denominator
                
                // Calculate the remainder
                numerator = numerator % denominator
                
                portion += String(wholePortion)
            }
            
            if (numerator > 0) {
                portion += wholePortion > 0 ? " " : ""
                portion += "\(numerator)/\(denominator)"
            }
        }
        
        if var unit = ingredient.unit {
            // Pluralize
            if wholePortion > 1 {
                if unit.suffix(2) == "ch" {
                   unit += "es"
                }
                
                else if unit.suffix(1) == "f" {
                    unit = String(unit.dropLast())
                    unit += "ves"
                }
                
                else {
                    unit += "s"
                }
            }
            
            portion += ingredient.num == nil && ingredient.denom == nil ? "" : " "
            return portion + unit
        }
        
        return portion
    }
}
