//
//  TypesTest.swift
//  BattleSimulatorTests
//
//  Created by Yuri on 23/08/18.
//  Copyright © 2018 Davi Cabral. All rights reserved.
//

import XCTest
@testable import PokemonKit

class TypesTest: XCTestCase {

    func test_grassStrongAttack() {
        let strong: [Type] = [.ground, .rock, .water]
        XCTAssertEqual(Type.grass.strongAttack, strong)
    }

    func test_grassWeakAttack() {
        let weak: [Type] = [.flying, .poison, .bug, .steel, .fire, .grass, .dragon]
        XCTAssertEqual(Type.grass.weakAttack, weak)
    }
}
