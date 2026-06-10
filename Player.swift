//
//  Player.swift
//  ScoreKeeper
//
//  Created by Mobile on 2/10/26.
//
import Foundation


struct Player: Identifiable {
    let id = UUID()
    
    var name: String
    var score: Int
    var roundScore: Int = 0
}

extension Player: Equatable {
    static func == (lhs: Player, rhs: Player) -> Bool {
        lhs.name == rhs.name && lhs.score == rhs.score && lhs.roundScore == rhs.roundScore
    }
}
