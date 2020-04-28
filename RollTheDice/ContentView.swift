//
//  ContentView.swift
//  RollTheDice
//
//  Created by Nikita Hasis on 3/21/20.
//  Copyright © 2020 Nikita Hasis. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State var playerOneRoll = 0
    @State var playerTwoRoll = 0
    @State var rolledIt = false
    @State var playerOneScore = 0
    @State var playerTwoScore = 0
    @State var feedback = "Press Below to Start!"

    var body: some View {
        ZStack {
            Color(red: 50 / 255, green: 0 / 255, blue: 20 / 255)
            .edgesIgnoringSafeArea(.all)
            
            VStack {
                Text("Dice Game")
                    .font(.custom("BungeeShade-Regular", size: 50))
                    .padding(.bottom, 50)
                    .foregroundColor(.orange)
                    .shadow(color: Color.black, radius: 5, x: 10, y: 10)
                    .gesture(
                        LongPressGesture(minimumDuration: 2.0)
                            .onEnded({ _ in
                                self.playerOneScore = 0
                                self.playerTwoScore = 0
                                self.rolledIt = false
                                self.feedback = "Press Below to Start!"
                            })
                    )
                
                HStack {
                    VStack {
                        Text("Player One")
                            .foregroundColor(.orange)
                            .font(.custom("Chango-Regular", size: 20))
                            .padding(.bottom, 20)
                        Text("\(self.playerOneScore)")
                            .font(.custom("Monoton-Regular", size: 90))
                            .frame(width: 150, height: 150)
                            .background(Color.orange)
                            .cornerRadius(20)
                            .aspectRatio(contentMode: .fill)
                            .clipped()
                            .padding(.horizontal, 25)
                            .shadow(color: Color.black, radius: 5, x: 10, y: 10)
                    }
                    
                    VStack {
                        Text("Player Two")
                            .foregroundColor(.orange)
                            .font(.custom("Chango-Regular", size: 20))
                            .padding(.bottom, 20)
                        Text("\(self.playerTwoScore)")
                            .font(.custom("Monoton-Regular", size: 90))
                            .frame(width: 150, height: 150)
                            .background(Color.orange)
                            .cornerRadius(20)
                            .aspectRatio(contentMode: .fill)
                            .clipped()
                            .padding(.horizontal, 25)
                            .shadow(color: Color.black, radius: 5, x: 10, y: 10)
                    }
                }
                .padding(.bottom, -20)
                
                HStack {
                    Image(rolledIt ? "\(playerOneRoll)" : "trollface")
                        .resizable()
                        .frame(width: 125, height: 125)
                        .aspectRatio(contentMode: .fit)
                        .clipped()
                        .padding(.horizontal, 25)
                    
                    Divider()
                    
                    Image(rolledIt ? "\(playerTwoRoll)" : "trollface")
                        .resizable()
                        .frame(width: 125, height: 125)
                        .aspectRatio(contentMode: .fit)
                        .clipped()
                        .padding(.horizontal, 25)
                }
                .background(Color.orange)
                .frame(height: 150)
                .cornerRadius(20)
                .shadow(color: Color.black, radius: 5, x: 10, y: 10)
                

                Text("\(self.feedback)")
                .font(.custom("Chango-Regular", size: 20))
                .foregroundColor(Color.orange)
                .padding(.top, 20)
                .shadow(color: Color.black, radius: 5, x: 10, y: 10)

                VStack {
                    Button(action: {
                        self.rolledIt = true
                        var randomNumber = Int.random(in: 1 ..< 7)
                        self.playerOneRoll = randomNumber
                        randomNumber = Int.random(in: 1 ..< 7)
                        self.playerTwoRoll = randomNumber
                        
                        switch self.playerOneRoll {
                            case _ where self.playerOneRoll < self.playerTwoRoll:
                                self.playerTwoScore = self.playerTwoScore + 1
                                self.feedback = "Player Two Won"
                            case _ where self.playerOneRoll > self.playerTwoRoll:
                                self.playerOneScore = self.playerOneScore + 1
                                self.feedback = "Player One Won"
                            default:
                                self.feedback = "Draw!"
                        }
                    }) {
                        RollButtonContent()
                    }
                    .padding(.top, 30)
                    .shadow(color: Color.black, radius: 5, x: 10, y: 10)
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct RollButtonContent: View {
    var body: some View {
        Text("Roll the dice")
            .frame(width: 240, height: 75)
            .foregroundColor(.black)
            .font(.custom("Monoton-Regular", size: 20))
            .background(Color.orange)
            .cornerRadius(20)
    }
}
