//
//  ViewController.swift
//  Mis Recetas
//
//  Created by Felipe Hernandez on 02-07-17.
//  Copyright © 2017 kafecode. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {
    
    var recipes : [Recipe] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        
                
        //esconder el navigation bar
        //navigationController?.hidesBarsOnSwipe = true
        
        var recipe = Recipe(name: "Tortilla de papas",
                            image: #imageLiteral(resourceName: "papaspastel"),
                            time: 120,
                            ingredients: ["Ingrediente 1","Ingrediente 2","Ingrediente 3"],
                            steps: ["Paso 1","Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor ","Paso 3"])
        recipes.append(recipe)
        
        recipe = Recipe(name: "Porotos con riendas",
                        image: #imageLiteral(resourceName: "fideos"),
                        time: 120,
                        ingredients: ["Ingrediente 1","Ingrediente 2","Ingrediente 3"],
                        steps: ["Paso 1","Paso 2","Paso 3"])
        recipes.append(recipe)
        
        recipe = Recipe(name: "Hamburgesas de soya"
            , image: #imageLiteral(resourceName: "hamburgesas"),
              time: 120,
              ingredients: ["Ingrediente 1","Ingrediente 2","Ingrediente 3"],
              steps: ["Paso 1","Paso 2","Paso 3"])
        recipes.append(recipe)
        
        recipe = Recipe(name: "Lentejas"
            , image: #imageLiteral(resourceName: "lentejas"),
              time: 120,
              ingredients: ["Ingrediente 1","Ingrediente 2","Ingrediente 3"],
              steps: ["Paso 1","Paso 2","Paso 3"])
        recipes.append(recipe)
        
        recipe = Recipe(name: "Garbanzos"
            , image: #imageLiteral(resourceName: "garbanzos"),
              time: 120,
              ingredients: ["Ingrediente 1","Ingrediente 2","Ingrediente 3"],
              steps: ["Paso 1","Paso 2","Paso 3"])
        recipes.append(recipe)
        
        recipe = Recipe(name: "Ensalada césar"
            , image: #imageLiteral(resourceName: "ensalada"),
              time: 120,
              ingredients: ["Ingrediente 1","Ingrediente 2","Ingrediente 3"],
              steps: ["Paso 1","Paso 2","Paso 3"])
        recipes.append(recipe)
        
        recipe = Recipe(name: "Pizza Española"
            , image: #imageLiteral(resourceName: "pizza"),
              time: 120,
              ingredients: ["Ingrediente 1","Ingrediente 2","Ingrediente 3"],
              steps: ["Paso 1","Paso 2","Paso 3"])
        recipes.append(recipe)
        
        recipe = Recipe(name: "Pure de papas"
            , image: #imageLiteral(resourceName: "pure"),
              time: 120,
              ingredients: ["Ingrediente 1","Ingrediente 2","Ingrediente 3"],
              steps: ["Paso 1","Paso 2","Paso 3"])
        recipes.append(recipe)
        
        recipe = Recipe(name: "Empanadas"
            , image: #imageLiteral(resourceName: "fideos"),
              time: 120,
              ingredients: ["Ingrediente 1","Ingrediente 2","Ingrediente 3"],
              steps: ["Paso 1","Paso 2","Paso 3"])
        recipes.append(recipe)
        
    }
    
    //esconder el navigation bar
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        navigationController?.hidesBarsOnSwipe = true
    }

    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override var prefersStatusBarHidden: Bool {
        get {
            return true
        }
    }
    
    
    
    //MARK: - UITableViewDataSource
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.recipes.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let recipe = recipes[indexPath.row]
        let cellID = "recipeCell"
        
        //dequeueReusableCell: reutiliza las celdas visibles en la pantalla, a medida que se avanza la primera
        //se destruye y la última se genera
        let cell = tableView.dequeueReusableCell(withIdentifier: cellID, for: indexPath) as! RecipeCell
        
        cell.thumbnailImageView.image = recipe.image
        cell.nameLabel.text = recipe.name
        cell.timeLabel.text = "Tiempo de cocción: \(recipe.time!)"
        cell.ingredientsLabel.text = "Catidad de ingredientes: \(recipe.ingredients.count)"
        
        //personalizar la imageView
        /*cell.thumbnailImageView.layer.cornerRadius = 42.0
        cell.thumbnailImageView.clipsToBounds = true*/
        
        /*if recipe.isFavourite{
            cell.accessoryType = .checkmark
        }else{
            cell.accessoryType = .none
        }
        */
        return cell
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        
        if editingStyle == .delete{
          self.recipes.remove(at: indexPath.row)
        
        }
        
        self.tableView.deleteRows(at: [indexPath], with: .fade)
    }
    
    override func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        
        //compartir
        let shareAction = UITableViewRowAction(style: .default, title: "Compartir") { (action, indexPath) in
            let shareDeflaultText = "Estoy mirando la receta de \(self.recipes[indexPath.row].name!) en la app recipesBook"
            
            let activityController = UIActivityViewController(activityItems: [shareDeflaultText, self.recipes[indexPath.row].image!], applicationActivities: nil)
            
            self.present(activityController, animated: true, completion: nil)
            
        }
        
        shareAction.backgroundColor = UIColor(red: 30.0/255.0, green: 164.0/255, blue: 253.0/255.0, alpha: 1.0)
        
        //borrar
        let deleteAction = UITableViewRowAction(style: .default, title: "Borrar") { (action, indexPath) in
            self.recipes.remove(at: indexPath.row)
            self.tableView.deleteRows(at: [indexPath], with: .fade)
        }
        
        deleteAction.backgroundColor = UIColor(red: 202.0/255.0, green: 202.0/255.0, blue: 202.0/255.0, alpha: 1.0)
        
        return [shareAction,deleteAction]
    }
    
    
    //MARK: - UITableViewDelegate
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        /*let recipe = self.recipes[indexPath.row]
        
        let alertController = UIAlertController(title: recipe.name, message: "Valorar este plato", preferredStyle: .alert)
        let cancelAction = UIAlertAction(title: "Cancelar", style: .cancel, handler: nil)
        alertController.addAction(cancelAction)
        
        var fauvoriteActionTitle = "Favorito"
        var fauvoriteActionStyle = UIAlertActionStyle.default
        if recipe.isFavourite{
            fauvoriteActionTitle = "No favorito"
            fauvoriteActionStyle = UIAlertActionStyle.destructive
        }
        
        let fauvoriteAction = UIAlertAction(title: fauvoriteActionTitle, style: fauvoriteActionStyle) { (action) in
            
            let recipe = self.recipes[indexPath.row]
            recipe.isFavourite = !recipe.isFavourite
            
            self.tableView.reloadData()
        }
        
        alertController.addAction(fauvoriteAction)
        
        self.present(alertController, animated: true, completion: nil)*/
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showRecipeDetail"{
            
            if let indexPath = self.tableView.indexPathForSelectedRow{
                
                let selectedRecipe = self.recipes[indexPath.row]
                let destinationViewController = segue.destination as! DetailViewController
                
                destinationViewController.recipe = selectedRecipe
            }
        
        }
    }
    
   
}

