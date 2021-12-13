//
//  Ingredient.swift
//  Recipes
//
//  Created by Mario Jackson on 12/13/21.
//

import Foundation

class Ingredient: Identifiable, Decodable {
    var id:UUID?
    var name:String
    var num:Int?
    var denom:Int?
    var unit:String?
}
