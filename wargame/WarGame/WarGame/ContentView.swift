//
//  ContentView.swift
//  test
//
//  Created by Lukasz Pietraszek on 04/10/2022.
//

import SwiftUI

struct ContentView: View {
    
   @State private var playCard = "card5"
    @State private var cpuCard = "card9"
    
    @State private var playerScore = 0
    @State private var cpuScore = 0
    
    
    var body: some View {

        ZStack{
            Image("background").resizable(resizingMode: .stretch).ignoresSafeArea()
            
            VStack {
                Spacer()
                Image("logo")
                Spacer()
                HStack {
                    Spacer()
                    Image(playCard)
                    Spacer()
                    Image(cpuCard)
                    Spacer()
                    
                }
                Spacer()

       
                
                
                Button(action: {
                    
                    
                    let playerRand = Int.random(in: 2...14)
                    let cpuRand = Int.random(in: 2...14)
                    
                    
                    playCard = "card"+String(playerRand)
                    cpuCard = "card"+String(cpuRand)
                    
                    if(playerRand > cpuRand){
                        playerScore += 1
                    } else if(cpuRand > playerRand){
                        cpuScore += 1
                    }
                    
                   
                    
                }, label: {
                    Image("dealbutton")
                })

                Spacer()
                HStack {
                    Spacer()
                    VStack {
                        Text("User")
                            .font(.headline)
                            .foregroundColor(Color.white)
                            .padding(.bottom, 10.0)
                        Text(String(playerScore))
                            .font(.largeTitle)
                            .foregroundColor(Color.white)
                           
                    }
                    Spacer()
                    VStack {
                        Text("CPU")
                            .font(.headline)
                            .foregroundColor(Color.white)
                            .padding(.bottom, 10.0)
                        Text(String(cpuScore))
                            .font(.largeTitle)
                            .foregroundColor(Color.white)
                    }
                    Spacer()
                }
                Spacer()
                Button(action:{
                    playerScore = 0
                    cpuScore = 0
                    playCard = "card5"
                    cpuCard = "card5"
                }, label:{
                    Image(systemName: "gobackward").resizable().frame(width: 32.0, height: 32.0).foregroundColor(Color.orange)
                })
                
                
            }
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .previewInterfaceOrientation(.portrait)
    }
}
