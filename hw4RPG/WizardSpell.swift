//
//  WizardSpell.swift
//  hw4RPG
//
//  Created by куба жанат on 22.06.2022.
//

class WizardSpell {
    
    static func heal(wound: Int) -> Int {
        //call to check if there's a random weapon,
        //if yes : print the news and set the value to be added to life points
        happyRound.randomWeaponProcess()
        //if there's a special weapon this round
        if (GlobalProperties.happyWeapon == 1) {
            GlobalProperties.cureLife += 20
            //default
        } else {
            GlobalProperties.cureLife += 10
        }
        return GlobalProperties.cureLife
    }
}
