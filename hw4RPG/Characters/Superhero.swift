//
//  Colossus.swift
//  hw4RPG
//
//  Created by куба жанат on 22.06.2022.
//

import Foundation

final class Superhero: Character {
    init(name: String) {
        super.init(name: name, type: .Superhero, lifePoints: 15, maxLife: 170, weapon: SpikedShield())
    }
}

