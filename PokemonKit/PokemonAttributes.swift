//
//  PokemonAttributes.swift
//  PokemonKit
//
//  Created by Yuri on 23/08/18.
//  Copyright © 2018 Davi Cabral. All rights reserved.
//

import Foundation

public protocol PokemonAttributes {
   
    var name: String { get set }
    var type: Type { get set }
    var cp: Int? { get set }
    var dps: Int { get set }
    var image: UIImage? { get }
}

public extension PokemonAttributes {
    
    var image: UIImage? {
        let bundle = Bundle(for: FightLogic.self)
        return UIImage(named: name, in: bundle, compatibleWith: nil)
    }
    
}

extension PokemonAttributes where Self:Codable {
    
    public static func all(bundle: Bundle = Bundle(for: FightLogic.self)) -> [Self]? {
        guard let path = bundle.url(forResource: "Pokemons", withExtension: "json") else {
            return nil
        }
        let pokemonData = try? Data(contentsOf: path)
        let pokemons = try? JSONDecoder().decode([Self].self, from: pokemonData!)
        return pokemons
    }
    
}
