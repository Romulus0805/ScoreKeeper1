//
//  SettingsView.swift
//  ScoreKeeper
//
//  Created by Mobile on 2/11/26.
//
import SwiftUI


struct SettingsView: View {
    @Binding var doesHighestScoreWin: Bool
    @Binding var startingPoints: Int
    @Binding var numberOfRounds: Int
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("Game Rules")
                .font(.headline)
            Divider()
            Picker("Win condition", selection: $doesHighestScoreWin) {
                Text("Highest Score Wins")
                    .tag(true)
                Text("Lowest Score Wins")
                    .tag(false)
            }
            Picker("Starting points", selection: $startingPoints) {
                Text("0 starting points")
                    .tag(0)
                Text("10 starting points")
                    .tag(10)
                Text("20 starting points")
                    .tag(20)
            }
            Picker("number of rounds", selection: $numberOfRounds) {
                Text("5 rounds")
                    .tag(5)
                Text("10 rounds")
                    .tag(10)
                Text("15 rounds")
                    .tag(15)
                Text("20 rounds")
                    .tag(20)
            }
        }
        .padding()
        .background(.thinMaterial, in: .rect(cornerRadius: 10.0))
    }
}


#Preview {
    @Previewable @State var doesHighestScoreWin = true
    @Previewable @State var startingPoints = 10
    @Previewable @State var numberOfRounds: Int = 10
    SettingsView(doesHighestScoreWin: $doesHighestScoreWin, startingPoints: $startingPoints, numberOfRounds: $numberOfRounds)
}
