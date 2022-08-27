//
//  Cows_and_bullsApp.swift
//  Cows-and-bulls
//
//  Created by Aarni on 8.7.2022.
//

import SwiftUI

@main
struct Cows_and_bullsApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}

extension StringProtocol  {
    var digits: [Int] { compactMap(\.wholeNumberValue) }
}
