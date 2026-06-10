//
//  ScoreKeeper.swift
//  ScoreKeeper
//
//  Created by Mobile on 2/10/26.
//
import Foundation


struct Scoreboard {
    var players: [Player] = [
        Player(name: "Elisha", score: 0),
        Player(name: "Andre", score: 0),
        Player(name: "Jasmine", score: 0),
    ]


    var state = GameState.setup
    var doesHighestScoreWin = true
    var round: Int = 1
    
    var winners: [Player] {
        guard state == .gameOver else { return [] }
        
        return players.filter { player in
            player.roundScore == theWinningRoundScore
        }
    }
    var theWinningRoundScore: Int {
        var winningScore: Int = 0
        if doesHighestScoreWin {
            winningScore = Int.min
            for player in players {
                winningScore = max(player.roundScore, winningScore)
            }
        } else {
            winningScore = Int.max
            for player in players {
                winningScore = min(player.roundScore, winningScore)
            }
        }
        return winningScore
    }
    
    var theWinningScore: Int {
        var winningScore = 0
        if doesHighestScoreWin {
            winningScore = Int.min
            for player in players {
                winningScore = max(player.score, winningScore)
            }
        } else {
            winningScore = Int.max
            for player in players {
                winningScore = min(player.score, winningScore)
            }
        }
        return winningScore
    }
    
    mutating func resetScores(to newValue: Int) {
        for index in 0..<players.count {
            players[index].score = newValue
            players[index].roundScore = 0
        }
        round = 1
    }
    
    mutating func resetGameScores(to newValue: Int) {
        for index in 0..<players.count {
            players[index].score = newValue
        }
    }
    mutating func addRoundScore() {
        for index in 0..<players.count {
            if players[index].score == theWinningScore {
                players[index].roundScore += 1
            }
        }
    }
}
