//
//  FightLogic.swift
//  BattleSimulator
//
//  Created by Davi Cabral on 22/08/18.
//  Copyright © 2018 Davi Cabral. All rights reserved.
//

import Foundation

public class FightLogic {
    static func multiplier(attacker: Type, defensor: Type) -> Double {
        if attacker.strongAttack.contains(defensor) {
            return 1.5
        } else if attacker.weakAttack.contains(defensor) {
            return 0.74
        }
        return 1
    }
    
    static func damagePerSecond(attacker: PokemonAttributes, defender: PokemonAttributes) -> (Double, Double) {
        let attackerDPS = Double(attacker.dps) * multiplier(attacker: attacker.type, defensor: defender.type)
        let defenderDPS = Double(defender.dps) * multiplier(attacker: defender.type, defensor: attacker.type)
        return (attackerDPS, defenderDPS)
    }
    
    static func secondsToZeroCP(dps: Double, cp: Int) -> Double {
        return Double(cp)/dps
    }
    
    
    public static func winnerFromBattle< T : PokemonAttributes & Equatable >(attacker: T, defender: T) -> T? {
        if attacker == defender { return nil }
        let damages = damagePerSecond(attacker: attacker, defender: defender)
        let attackerTime = secondsToZeroCP(dps: damages.0, cp: defender.cp!)
        let defenderTime = secondsToZeroCP(dps: damages.1, cp: attacker.cp!)

        return attackerTime < defenderTime ? attacker : defender
    }
}
