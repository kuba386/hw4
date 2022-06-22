//
//  Game.swift
//  hw4RPG
//
//  Created by куба жанат on 22.06.2022.
//

import Foundation


final class Game {
    
    // MARK: - Properties
    
    private let playerFactory = PlayerFactory()
    
    private var players = [Player]()
    
    private var numberOfTurns = 1
    
    // MARK: - Methods
    
    public func principalMenu() {
        print("""

    
    -------------------------------------------------------------------------------
                                    Боевая игра

             Эй, тебя поймали враги. Но нам повезло, что они
        выбрали тебя нашим капитаном. Случайно я уже проверил наши возможные команды.
        Вот посмотри:
             
            + Warrior со 100 очками жизни и мечом с 10 уроном.
            + Mag с 60 очками жизни и магическим посохом с 30 исцелениями, но не способный атаковать
            + Superhero с 150 очками жизни и шипастым щитом с 3 повреждениями.

        Вы можете выбрать максимум 3 персонажа, пока у кого-то не погибнут все персонажи.
       Для хорошего старта мы дали всем персонажам волшебный напиток на 20 очков жизни.

        Может быть, у вас появится шанс найти новое оружие, кто знает...

                Удачи вам!

        ---------------------------------------------------------------------------------

          1. Новая игра
          2. Выйти из игры
           
""")
        
        // если игрок выбирает 1 или 2
        if let line = readLine() {
            switch line {
            case "1": // переходим к созданию бойцов
                // Метод создания бойцов из экземпляра PlayerFactory
                playerFactory.createPlayers()
                // настраиваем игроков на игроков в классе playerFactory
                players = playerFactory.players
                fight()
                endGame()
            case "2":
                print("Ты вышел")
            default:
                print("Вы должны выбрать 1 или 2. ")
                principalMenu()
            }
        }
    }
    
    /// борьба продолжается до тех пор, пока не будет проигравшего
    private func fight() {
        while true {
            for i in 0..<2 {
                print("")
                print(players[i].name + " выберите своего персонажа")
                players[i].descriptionCharacters()
                print("")
                let chosenCharacter = players[i].characters[userChoice() - 1]
                print("")
                misteryBox(chosenCharacter)
                if let magus = chosenCharacter as? Magus {
                    print("выберите персонажа для лечения")
                    players[i].descriptionCharacters()
                    magus.heal(players[i].characters[userChoice() - 1])
                } else {
                    if i == 0 {
                        let target = players[i + 1]
                        print("")
                        fightDetails(target: target, character: chosenCharacter, index: i)
                        if players[i + 1].isLoser {
                            return
                        }
                    } else {
                        let target = players[i - 1]
                        fightDetails(target: target, character: chosenCharacter, index: i)
                        if players[i - 1].isLoser {
                            return
                        }
                    }
                }
            }
            numberOfTurns += 1
        }
    }
    
    /// Действие каждый раз, когда игроку нужно выбрать персонажа каждой команды
    private func fightDetails(target: Player, character: Character, index : Int) {
        target.descriptionCharacters()
        print("выбрать персонажа для атаки!")
        let myTarget = target.characters[userChoice() - 1]
        character.attack(myTarget)
    }
    
    /// Задавайте выбор пользователю каждый раз, когда это необходимо
    private func userChoice() -> Int {
        var userChoice = 0
        repeat {
            if let data = readLine() {
                if let integer = Int(data) {
                    userChoice = integer
                }
            }
        } while userChoice != 1 && userChoice != 2 && userChoice != 3
        return userChoice
    }
    
    /// Бонус
    private func misteryBox(_ character: Character) {
        let randomNumber = Int.random(in: 1...99)
        if character.lifePoints >= 1, randomNumber <= 40 {
            print("Волшебный сундук только что появился ")
            if character is Magus {
                print("""
                    Поздравляем! Вы нашли AngelStick с 70 исцеляющими свойствами, давайте воспользуемся этим прямо сейчас.

""")
                
                let newWeapon = AngelStick()
                character.weapon = newWeapon
            } else {
                print("""
                        Поздравляем! Вы нашли нож с 70 уроном таким мощным.

""")
                
                let newWeapon = Knife()
                character.weapon = newWeapon
            }
        }
    }
    /// Показать статистику
    private func endGame() {
        for player in players {
            print("игрок : " + player.name)
            player.descriptionCharacters()
            print("")
        }
        for player in players {
            if player.isLoser {
                print("\(player.name) проиграл")
            }
        }
        print("с общим числом \(numberOfTurns) оборотa")
    }
}



