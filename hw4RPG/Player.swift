//
//  Player.swift
//  hw4RPG
//
//  Created by куба жанат on 22.06.2022.
//

import Foundation

final class Player {
    
    // MARK: - Properties
    
    let name: String
    var characters = [Character]()
    
    var isLoser: Bool {
        var isLoser = false
        for character in characters {
            if character.isDead {
                isLoser = true
            } else { return false }
        }
        return isLoser
    }
    
    // MARK: - Methods
    
    init(name: String) {
        self.name = name
    }
    
    public func descriptionCharacters() {
        for (index, character) in characters.enumerated() {
            print(character.description(index: index + 1))
        }
    }
}

