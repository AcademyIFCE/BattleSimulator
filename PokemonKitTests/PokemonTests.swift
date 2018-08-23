//
//  PokemonTests.swift
//  BattleSimulatorTests
//
//  Created by Yuri on 23/08/18.
//  Copyright © 2018 Davi Cabral. All rights reserved.
//

import XCTest
@testable import PokemonKit

class PokemonTests: XCTestCase {
    func test_fetchAllPokemons_syncSuccess() {
        let pokemons = MockPokemon.all()
        XCTAssertNotNil(pokemons)
    }
    
    func test_fetchAllPokemons_asyncSuccess() {
        let expec = expectation(description: "Wait for pokemons")
        expec.expectedFulfillmentCount = 1
        MockPokemon.fetchAllAsync { pokemons in
            expec.fulfill()
            XCTAssertNotNil(pokemons)
        }
        wait(for: [expec], timeout: 3)
    }
    
    func test_fetchAllPokemons_syncError() {
        let pokemons = MockPokemon.all(bundle: Bundle(for: PokemonTests.self))
        XCTAssertNil(pokemons)
    }
}

extension MockPokemon {
    static func fetchAllAsync(completion: @escaping ([MockPokemon]?) -> Void) {
        Timer.scheduledTimer(withTimeInterval: 2, repeats: false) { _ in
            completion(MockPokemon.all())
        }
    }
}
