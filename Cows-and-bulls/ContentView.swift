//
//  ContentView.swift
//  Cows-and-bulls
//
//  Created by Aarni on 8.7.2022.
//

import SwiftUI

struct ContentView: View {
    @Environment(\.openURL) var openURL

    // use tabview
    // use navigationlink

    var body: some View {

        VStack(alignment: .center) {
            VStack(spacing: 32) {

                Text("Cows And Bulls")
                    .font(
                        .system(.largeTitle, design: .rounded)
                        .weight(.light)
                    )

                HStack() {
                    Button(action: {()}) {
                        Text("Singleplayer")
                            .padding(10)
                            .foregroundColor(.black)
                            .background(Color.blue)
                            .cornerRadius(20)

                    }

                    Button(action: {()}) {
                        Text("Multiplayer")
                            .padding(10)
                            .foregroundColor(.black)
                            .background(Color.blue)
                            .cornerRadius(20)
                    }
                }
                Button("How to play") {
                    openURL(URL(string: "https://en.wikipedia.org/wiki/Bulls_and_Cows")!)
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

