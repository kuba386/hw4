//
//  SetUpPLayers.swift
//  hw4RPG
//
//  Created by куба жанат on 22.06.2022.
//

import Foundation

class SetUpPLayers {
    
    //set up players' names
    func setUpPlayersNames() {
        
        //getPlayerName is a method of Player
        player0.getPlayerName()
        player1.getPlayerName()
        
        print(">hello \(player0.nameOfPlayer) !"
            + "\n>hello \(player1.nameOfPlayer) !")
        
        //call to wait before clearing tty's window
        //utilities.waitAndClearTty(delay: GlobalProperties.time)
        
        print(">welcome to terminalCombat")
        //utilities.waitAndClearTty(delay: GlobalProperties.time)
        
        //open readme.md @ github
        utilities.openRules()
    }
}

