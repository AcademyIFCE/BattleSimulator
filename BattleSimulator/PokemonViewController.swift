//
//  PokemonViewController.swift
//  BattleSimulator
//
//  Created by Davi Cabral on 22/08/18.
//  Copyright © 2018 Davi Cabral. All rights reserved.
//

import UIKit

protocol PokemonDelegate: class {
    func didSelectPokemon(_ pokemon: Pokemon, toSide side: SelectionSide)
}

class PokemonViewController: UIViewController {

    @IBOutlet weak var pokemonCollectionView: UICollectionView!
    
    var selectedSide: SelectionSide!
    weak var delegate: PokemonDelegate?
    
    private var pokemons: [Pokemon]!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        guard let path = Bundle.main.url(forResource: "Pokemons", withExtension: "json") else {
            fatalError("No JSON was found")
        }
        let pokemonData = try? Data(contentsOf: path)
        pokemons = try? JSONDecoder().decode([Pokemon].self, from: pokemonData!)
        
        self.pokemonCollectionView.dataSource = self
        self.pokemonCollectionView.delegate = self
    }

}

extension PokemonViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return pokemons.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "pokemonCell", for: indexPath) as? PokemonCollectionViewCell else {
            fatalError("Cell not found")
        }
        
        let pokemon = pokemons[indexPath.row]
        cell.pokemonImageView.image = pokemon.image
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let pokemon = pokemons[indexPath.item]
        delegate?.didSelectPokemon(pokemon, toSide: selectedSide)
        self.navigationController?.popViewController(animated: true)
    }
    
    
    
}
