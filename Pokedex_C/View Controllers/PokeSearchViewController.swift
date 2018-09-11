//
//  PokeSearchViewController.swift
//  Pokedex_C
//
//  Created by John Tate on 9/11/18.
//  Copyright © 2018 John Tate. All rights reserved.
//

import UIKit

class PokeSearchViewController: UIViewController {

    @IBOutlet weak var pokeSearchBar: UISearchBar!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var idLabel: UILabel!
    @IBOutlet weak var abilitiesLabel: UILabel!
    
    var pokemon: JJTPokemon?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // set the delegate
        pokeSearchBar.delegate = self
        
        //hard-code a Pokemon for testing and to appear when the view loads
        JJTPokemonController.fetchPokemon(forSearchTerm: "Dewgong") { (pokemon) in
            // sets class-level variable equal to the pokemon from the completion
            // class-level variable is then available outside of the closure
            self.pokemon = pokemon
            DispatchQueue.main.async {
                self.updateViews()
            }
        }
    }

    func updateViews() {
        guard let pokemon = pokemon else { return }
        
        nameLabel.text = pokemon.name
        idLabel.text = "\(pokemon.identifier)"
        abilitiesLabel.text = "Abilities: " + (pokemon.abilities.joined(separator: ", "))
    }
}

extension PokeSearchViewController: UISearchBarDelegate {
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        JJTPokemonController.fetchPokemon(forSearchTerm: searchText) { (pokemon) in
            self.pokemon = pokemon
            DispatchQueue.main.async {
                self.updateViews()
            }
        }
    }
    
}
