//
//  Sword.swift
//  hw4RPG
//
//  Created by куба жанат on 22.06.2022.
//

import Foundation

/// Основное оружие
final class Sword: Weapon {
    init() {
        super.init(damage: 10, WeaponName:"Меч", healing: 0)
    }
}
