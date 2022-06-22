//
//  PlayerFactory.swift
//  hw4RPG
//
//  Created by куба жанат on 22.06.2022.
//

import Foundation

final class PlayerFactory {
    
    // MARK: - Properties
    
    var players = [Player]()
    private let maxPlayers = 2
    private let maxCharacters = 3
    private var characterNames = [String]()
    private var playerNames = [String]()
    
    /// Создание игроков с помощью функции create Player
    func createPlayers() {
        for i in 0..<maxPlayers {
            print("создание игрока №\(i + 1)")
            guard let player = createPlayer() else { return }
            players.append(player)
        }
    }
    
    /// Создайте одного игрока с помощью createCharacters
    private func createPlayer() -> Player? {
        let player = Player(name: uniquePlayerName())
        guard  let characters = createCharacters() else  { return nil }
        player.characters = characters
        return player
    }
    
    /// Создайте полную команду с помощью createCharacter
    private func createCharacters() -> [Character]? {
        var characters = [Character]()
        for i in 0..<maxCharacters {
            print("персонаж №\(i + 1)")
            guard let character = createCharacter() else {
                print("Выберите номер, пожалуйста")
                return nil
            }
            characters.append(character)
        }
        return characters
    }
    
    /// Создание персонажа объекта в зависимости от выбора
    private func createCharacter() -> Character? {
        var userChoice = 0
        print("""
        1. Воин => 100 жизней / Меч: 10 (урон)
        2. Маг => 60 жизней / посох: 30 (исцеление)
        3. Супергерой => 150 жизней / Шипованный щит: 3 (урон)
        """)
        print("")
        repeat {
            if let data = readLine() {
                if let dataToInt = Int(data) {
                    userChoice = dataToInt
                }
            }
        } while userChoice != 1 && userChoice != 2 && userChoice != 3
        switch userChoice {
        case 1:
            return Warrior(name: uniqueCharacterName())
        case 2:
            return Magus(name: uniqueCharacterName())
        case 3:
            return Superhero(name: uniqueCharacterName())
        default:
            print("Выберите номер, пожалуйста")
            return nil
        }
    }
    
    /// Блокировать, если имя персонажа уже используется
    private func uniqueCharacterName() -> String {
        print("Введите имя персонажа: ")
        var characterName = ""
        repeat {
            if let data = readLine() {
                characterName = data
                if characterNames.contains(characterName) {
                    print("Имя этого персонажа уже занято")
                    characterName = ""
                } else {
                    characterNames.append(characterName)
                }
            }
        } while characterName == ""
        return characterName
    }
    
    /// Блокировать, если имя игрока уже используется
    private func uniquePlayerName() -> String {
        print("Введите имя игрока: ")
        print("")
        var playerName = ""
        repeat {
            if let data = readLine() {
                playerName = data
                if playerNames.contains(playerName) {
                    print("Имя этого игрока уже занято")
                    playerName = ""
                } else {
                    playerNames.append(playerName)
                }
            }
        } while playerName == ""
        return playerName
    }
}


