//
//  Warrior.swift
//  hw4RPG
//
//  Created by куба жанат on 22.06.2022.
//

import Foundation

final class Warrior: Character {
    
    // Каждый персонаж должен быть назван
    init(name: String) {
        // использовать init материнского класса (Персонажи со всеми приличиями)
        super.init(name: name, type: .Warrior, lifePoints: 10, maxLife: 120, weapon: Sword())
    }
}
