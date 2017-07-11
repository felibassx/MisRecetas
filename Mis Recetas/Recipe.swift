//
//  Recipe.swift
//  Mis Recetas
//
//  Created by Felipe Hernandez on 02-07-17.
//  Copyright © 2017 kafecode. All rights reserved.
//

import Foundation
import UIKit

class Recipe: NSObject{

    var name: String!
    var image: UIImage!
    var time: Int!
    var ingredients: [String]!
    var steps: [String]!
    //var isFavourite: Bool = false
    
    var rating: String = "rating"
    
    init(name: String, image: UIImage, time: Int, ingredients: [String], steps: [String]) {
        self.name = name
        self.image = image
        self.time = time
        self.ingredients = ingredients
        self.steps = steps
    }

}
