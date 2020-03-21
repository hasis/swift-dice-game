//
//  ContentView.swift
//  RollTheDice
//
//  Created by Nikita Hasis on 3/21/20.
//  Copyright © 2020 Nikita Hasis. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State var rolledNumber = 0
    @State var rolledIt = false

    var body: some View {
        VStack {
            Image(rolledIt ? "\(rolledNumber)" : "unknown")
            .resizable()
            .frame(width: 100, height: 100)
            .aspectRatio(contentMode: .fit)
            .clipped()
                .padding(.top, 250)
            Spacer()
            Button(action: {
                self.rolledIt = true
                let randomNumber = Int.random(in: 1 ..< 7)
                self.rolledNumber = randomNumber
            }) {
                RollButtonContent()
            }
            .padding(.bottom, 40)
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
            .foregroundColor(.white)
            .font(.headline)
            .background(Color.orange)
            .cornerRadius(20)
    }
}
