//
//  FightLogicTests.swift
//  BattleSimulatorTests
//
//  Created by Yuri on 23/08/18.
//  Copyright © 2018 Davi Cabral. All rights reserved.
//

import XCTest
@testable import PokemonKit

class FightLogicTests: XCTestCase {
    var attacker: MockPokemon?
    var defender: MockPokemon?
    
    var pokemons: [MockPokemon]? {
        didSet {
            if pokemons != nil {
                attacker = pokemons!.first
                defender = pokemons!.last
            } else {
                attacker = nil
                defender = nil
            }
        }
    }
    
    override func setUp() {
        super.setUp()
        self.pokemons = MockPokemon.all()
    }

    override func tearDown() {
        pokemons = nil
        super.tearDown()
    }
    
//    func test_timeToZero10() {
//        let time = FightLogic.
//    }
    
    func test_attacker_wins() {
        attacker?.cp = 1000
        attacker?.dps = 100
        attacker?.type = .fire
        
        defender?.cp = 1000
        defender?.dps = 100
        defender?.type = .grass
        
        let winner = FightLogic.winnerFromBattle(attacker: attacker!, defender: defender!)
        XCTAssertEqual(winner!, attacker!)
    }
}
