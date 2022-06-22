//
//  TeamMember.swift
//  hw4RPG
//
//  Created by куба жанат on 22.06.2022.
//

import Foundation

class TeamMember {
    
    var name: String
    var life: Int
    var strength: Int
    
    init(name: String, life: Int, strength: Int) {
        self.name = name
        self.life = life
        self.strength = strength
    }
    
    //print name, life and strength points
    func summarize() {
        //don't print the dead !
        if !(self.life <= 0) {
            print("\(self.name): life = \(self.life), strength = \(self.strength)")
        }
    }
}
