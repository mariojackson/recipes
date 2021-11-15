//
//  DataService.swift
//  Recipes
//
//  Created by Mario Jackson on 11/15/21.
//

import Foundation

class DataService {
    func getLocalRecipeData() -> [Recipe] {
        let filePath = Bundle.main.path(forResource: "recipes", ofType: "json")
        var recipes = [Recipe]()
        
        guard filePath != nil else {
            return [Recipe]()
        }
        
        let url = URL(fileURLWithPath: filePath!)
        
        do {
            let data = try Data(contentsOf: url)
            recipes = getRecipesFromJSON(data: data)
        } catch {
            print(error)
        }
        
        return recipes
    }
    
    private func getRecipesFromJSON(data: Data) -> [Recipe] {
        let decoder = JSONDecoder()
        var recipes = [Recipe]()
        
        do {
            recipes = try decoder.decode([Recipe].self, from: data)
            
            for recipe in recipes {
                recipe.id = UUID()
            }
            
        } catch {
            print(error)
        }
        
        return recipes
    }
}
