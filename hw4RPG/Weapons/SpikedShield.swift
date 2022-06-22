//
//  SpikedShield.swift
//  hw4RPG
//
//  Created by куба жанат on 22.06.2022.
//

import Foundation

/// Basic weapon
final class SpikedShield: Weapon {
    init() {
        super.init(damage: 3, WeaponName:"Шипованный щит", healing: 0)
    }
}
