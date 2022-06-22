//
//  Character.swift
//  hw4RPG
//
//  Created by куба жанат on 22.06.2022.
//

import Foundation

enum CharacterType: String {
    case Warrior, Mag, Superhero
}

class Character {
    
    // MARK: - Properties
    
    let name: String
    let type: CharacterType
    var weapon: Weapon
    let maxLife: Int
    var lifePoints: Int {
        // Наблюдатель перед завершением любого действия
        willSet {
            if newValue > lifePoints && newValue > 0  {
                print("Ваш персонаж исцеляется ... ")
            } else if newValue < lifePoints && newValue > 0 {
                print("Ваш персонаж нападает... ")
            } else {
                print("Ооо, вы получаете яростную атаку")
            }
        }
        // Observer after life change
        didSet {
            if oldValue > lifePoints && oldValue > 0 {
                print("\(self.name) потерял \(oldValue - lifePoints) очков жизни")
            } else if oldValue < lifePoints && oldValue > 0 {
                print("\(self.name) усиление \(lifePoints - oldValue) очков жизни")
            } else {
                print("Ты погиб в бою 💩")
            }
        }
    }
    
    /// Проверка жизни
    var isDead: Bool {
        return lifePoints <= 0
    }
    
    // MARK: - Methods
    
    init(name: String, type: CharacterType, lifePoints: Int, maxLife: Int, weapon: Weapon) {
        self.name = name
        self.type = type
        self.lifePoints = lifePoints
        self.maxLife = maxLife
        self.weapon  = weapon
    }
    
    /// Описание жизни персонажей
    func description(index: Int) -> String {
        if isDead {
            return("☠️ \(name) на \(type) \(lifePoints)/\(maxLife) погиб во время боя. ☠️")
        } else {
            return("\(index). \(name) на \(type) \(lifePoints)/\(maxLife) очки жизни /  \(weapon.weaponName) : \(weapon.damage) нанесение ущерба")
        }
    }
    
    /// Вычитание очков жизни цели
    func attack(_ target: Character) {
        // Вычесть урон оружия из очков жизни цели.
        let newLifePoint = target.lifePoints - self.weapon.damage
        
        if lifePoints > 0 { // Проверка жизни персонажа перед проверкой isDead
            if target.isDead {
                print("Вы не можете нападать на мертвых людей")
            } else {
                target.lifePoints = newLifePoint
                if target.lifePoints < 0  {
                    target.lifePoints = 0
                }
            }
        } else {
            print("Ваш персонаж уже мертв")
        }
    }
}

