//
//  Magus.swift
//  hw4RPG
//
//  Created by куба жанат on 22.06.2022.
//

import Foundation

final class Magus: Character {
    init(name: String) {
        super.init(name: name, type: .Mag, lifePoints: 6, maxLife: 80, weapon: MagusStick())
    }
    
    /// Изменить описание для мага
    override func description(index: Int) -> String {
        // Если он мертв, то ничего не изменится
        if self.isDead {
            return super.description(index: index + 1)
            // Изменить, чтобы показать исцеление
        } else {
            return "\(index). \(name) \(type) с \(lifePoints)/\(maxLife) очков жизни, исцеляется с помощью \(weapon.weaponName) по \(weapon.healing)"
        }
    }
    /// Блокировка атаки для печати сообщения
    override func attack(_ target: Character) {
        print("Извините, я не могу напасть.")
    }
    
    /// Исцелить персонажа
    internal func heal(_ target: Character) {
        // Чрезмерное исцеление не принимается
        // Пока цель имеет столько же жизней, сколько вы хотите исцелить.
        // Мы печатаем только полные жизни
        guard target.lifePoints != target.maxLife else {
            print("Ваш боец уже полон жизни")
            return
        }
        // Новая переменная для расчета новых очков жизни
        var newLifePoints = target.lifePoints + self.weapon.healing
        
        // Не заживает
        if newLifePoints >= target.maxLife {
            newLifePoints = target.maxLife
        }
        // Оператор Guard не заблокировался, поэтому мы можем добавить немного жизни
        target.lifePoints = newLifePoints
    }
}
