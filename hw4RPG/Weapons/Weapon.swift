//
//  Weapon.swift
//  hw4RPG
//
//  Created by куба жанат on 22.06.2022.
//

import Foundation

class Weapon {
    let damage: Int
    let weaponName: String
    let healing: Int
    
    init(damage: Int, WeaponName: String, healing: Int) {
        self.damage = damage
        self.weaponName = WeaponName
        self.healing = healing
    }
}
