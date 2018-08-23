//
//  Pokemon.swift
//  BattleSimulator
//
//  Created by Davi Cabral on 22/08/18.
//  Copyright © 2018 Davi Cabral. All rights reserved.
//

import UIKit
import PokemonKit

class Pokemon: PokemonAttributes, Codable, Equatable {

    var name: String
    var type: Type
    var cp: Int?
    var dps: Int
    var defense: Int
    
    enum CodingKeys: String, CodingKey {
        case name
        case type
        case defense
        case dps = "attack"
    }
    
    static func == (lhs: Pokemon, rhs: Pokemon) -> Bool {
        return lhs.cp == rhs.cp && lhs.dps == rhs.dps && lhs.type == rhs.type
    }
}
