//
//  MockPokemon.swift
//  PokemonKitTests
//
//  Created by Yuri on 23/08/18.
//  Copyright © 2018 Davi Cabral. All rights reserved.
//

import Foundation
@testable import PokemonKit

class MockPokemon: PokemonAttributes, Codable, Equatable {
    
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
    
    static func == (lhs: MockPokemon, rhs: MockPokemon) -> Bool {
        return lhs.cp == rhs.cp && lhs.dps == rhs.dps && lhs.type == rhs.type
    }
}
