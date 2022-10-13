//
//  ContentView.swift
//  GuessTheFlag
//
//  Created by Lukasz Pietraszek on 10/10/2022.
//

import SwiftUI

struct ContentView: View {
    @State private var showingScore = false
    @State private var scoreTitle = ""
    @State private var correctAnswers = 0
    @State private var wrongAnswers = 0
    
    @State private var countries = ["Estonia", "France", "Germany", "Ireland", "Italy", "Nigeria", "Poland", "Russia", "Spain", "UK", "US"].shuffled()

    @State private var correctAnswer = Int.random(in: 0...2)
    
    
    var body: some View {
        
        ZStack {
            RadialGradient(stops:[
                .init(color: Color(red: 0.1, green: 0.2, blue: 0.45), location: 0.3),
                    .init(color: Color(red: 0.71, green: 0.17, blue: 0.23), location: 0.3),
            ], center: .top, startRadius: 200, endRadius: 700)
            .ignoresSafeArea()

            VStack {
                Spacer()
                Text("Guess the Flag")
                    .font(.largeTitle.bold())
                    .foregroundColor(.white)
                Spacer()
                HStack {
                    Spacer()
                        VStack {
                            Text("Wrong")
                                .foregroundColor(.white)
                            Text("\(wrongAnswers)")
                                .foregroundColor(.white)
                                .font(.largeTitle.weight(.heavy))
                        }
                    Spacer()
                        VStack {
                            Text("Correct")
                                .foregroundColor(.white)
                            Text("\(correctAnswers)")
                                .foregroundColor(.white)
                                .font(.largeTitle.weight(.heavy))
                        }
                    Spacer()
                }
                Spacer()
                VStack(spacing: 45) {
                    
                    
                    VStack {
                        Text("Tap the flag for")
                            .foregroundColor(.white)
                            .font(.subheadline.weight(.semibold))
                        Text(countries[correctAnswer])
                            .foregroundColor(.white)
                            .font(.largeTitle.weight(.heavy))
                    }
                    
                    ForEach(0..<3) { number in
                        Button {
                            flagTapped(number)
                        } label: {
                            Image(countries[number])
                                .renderingMode(.original)
                                .clipShape(RoundedRectangle(cornerRadius: 10, style: .continuous))
                                .shadow(radius: 4)
                        }
                    }
                    
                }
                Spacer()
                Button{
                    reset()
                } label: {
                    Text("Reset")
                }
              

            }
        }
        .alert(scoreTitle, isPresented: $showingScore) {
            Button("Continue", action: askQuestion)
        }
   
    }
    
    func reset() {
        wrongAnswers = 0
        correctAnswers = 0
    }
    
    func flagTapped(_ number: Int) {
        if number == correctAnswer {
            scoreTitle = "Correct"
            correctAnswers += 1
        } else {
            scoreTitle = "Wrong"
            wrongAnswers += 1
        }
        
        showingScore = true
    }
    
    func askQuestion() {
        countries.shuffle()
        correctAnswer = Int.random(in: 0...2)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
