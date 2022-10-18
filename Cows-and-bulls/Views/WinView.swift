//
//  WinView.swift
//  Cows-and-bulls
//
//  Created by Aarni on 4.10.2022.
//


import SwiftUI

struct WinView: View {
    var body: some View {
        VStack {
            Text("You Won!")
                .foregroundColor(.black)
            
            // Text(\(results))

            HStack(alignment: .top) {
                Text("Restart")
            }
        }
    }
    
    func restartGame() {
        // open a fresh game view
    }
}

struct WinView_Previews: PreviewProvider {
    static var previews: some View {
        WinView()
    }
}
