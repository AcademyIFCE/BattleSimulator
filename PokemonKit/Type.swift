//
//  Types.swift
//  BattleSimulator
//
//  Created by Davi Cabral on 22/08/18.
//  Copyright © 2018 Davi Cabral. All rights reserved.
//

import Foundation


public enum Type: String, Codable {
    
    case normal
    case fighting
    case flying
    case poison
    case ground
    case rock
    case bug
    case ghost
    case steel
    case fire
    case water
    case grass
    case electric
    case psychic
    case ice
    case dragon
    
    var strongAttack: [Type] {
        switch self {
        case .normal:
            return [.rock, .ghost, .steel]
        case .fighting:
            return [.normal, .rock, .steel, .ice]
        case .flying:
            return [.fighting, .bug, .grass]
        case .poison:
            return [.grass]
        case .ground:
            return [.poison, .rock, .steel, .fire, .electric]
        case .rock:
            return [.flying, .bug, .fire, .ice]
        case .bug:
            return [.grass, .psychic]
        case .ghost:
            return [.ghost, .psychic]
        case .steel:
            return [.rock, .ice]
        case .fire:
            return [.bug, .steel, .ice, .grass]
        case .water:
            return [.ground, .rock, .fire]
        case .grass:
            return [.ground, .rock, .water]
        case .psychic:
            return [.fighting, .poison]
        case .ice:
            return [.flying, .ground, .grass, .dragon]
        case .dragon:
            return [.dragon]
        case .electric:
            return [.flying, .water]
        }
    }
    
    var weakAttack: [Type] {
        switch self {
        case .normal:
            return [.rock, .ghost, .steel]
        case .fighting:
            return [.flying, .poison, .psychic, .bug, .ghost]
        case .flying:
            return [.rock, .steel, .electric]
        case .poison:
            return [.poison, .ground, .rock, .ghost, .steel]
        case .ground:
            return [.flying, .bug, .grass]
        case .rock:
            return [.fighting, .ground, .steel]
        case .bug:
            return [.fighting, .flying, .poison, .ghost, .steel, .fire]
        case .ghost:
            return [.normal]
        case .steel:
            return [.steel, .fire, .water, .electric]
        case .fire:
            return [.rock, .fire, .water, .dragon]
        case .water:
            return [.water, .grass, .dragon]
        case .grass:
            return [.flying, .poison, .bug, .steel, .fire, .grass, .dragon]
        case .psychic:
            return [.fighting, .poison]
        case .ice:
            return [.steel, .fire, .water, .ice]
        case .dragon:
            return [.steel]
        case .electric:
            return [.ground, .grass, .electric, .dragon]
        }
    }
}
