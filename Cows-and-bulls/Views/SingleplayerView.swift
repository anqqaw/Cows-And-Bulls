//
//  SingleplayerView.swift
//  Cows-and-bulls
//
//  Created by Aarni on 14.8.2022.
//

import SwiftUI

/*
 Instruction for the player
    numbers are unique in the set of 4
    numbers are between 1 and 9
    letters can't be inserted
 OR
    just expect them to know and if they don't, let them check the help button
 */

struct SingleplayerView: View {
    @State var input: String = ""
    var guess = input

    var body: some View {
        VStack {

            // USE TABVIEW OR CONSIDER ABT IT
            // restart button

            TextField("Enter your guess", text: $input, prompt: Text("Guess"))
                .textFieldStyle(.roundedBorder)
                .font(.callout)
                .padding()
                .frame(maxWidth: 300)
                .cornerRadius(40)
                .keyboardType(.decimalPad)

            Button(action: {
             /*
                the game runs after this button has been pressed
              */
            }) {
                Text("Guess")
                    .foregroundColor(.black)
                    // .fontWeight(.bold)
                    .padding(10)
                    .frame(width: 100)
                    .background(Color.blue)
                    .cornerRadius(20)
             }
            /*
           Text("\(guesses)")
               .font(.title2)
               .foregroundColor(.black)
               .padding()
             */

        }
    }

    func generateRandomNumber() -> [Int] {

        var numberSet = [Int]()

        while (numberSet.count <= 3) {
            let randomNumber = Int.random(in: 1...9)

            if (!numberSet.contains(randomNumber)) {
                numberSet.append(randomNumber)
            }
        }

        return numberSet
    }

    let usersInput = guess.digits
    // let usersInput: [Int] = [1, 1, 6, 5] // no input if invalid

    func checkSimilarity() -> Bool {
        for i in 1...4 {
           for j in 1...4 {
               if (i != j) && (usersInput[i-1] == usersInput[j-1]) {
                   return true
               }
           }
        }
        return false
    }

    let randomNumber = generateRandomNumber()
    let check = checkSimilarity()

    func checkIfUseableNumber() -> Bool {
        if (!usersInput.isEmpty) && (!usersInput.contains(0)) && (!check) {
            return true
        }
        else {
            return false
        }
    }

    func checkCowsAndBulls() -> (cows: Int, bulls: Int) {
        
        var cows_count: Int = 0
        var bulls_count: Int = 0

        for i in 1...4 {
            for j in 1...4 {

                if usersInput[i-1] == randomNumber[j-1] {
                    cows_count += 1
                }
            }
            if Int(usersInput[i-1]) == randomNumber[i-1] {
                bulls_count += 1
            }
        }

        if bulls_count > 0 {
            cows_count -= bulls_count
        }

        return (cows_count, bulls_count)
    }
    func theCheck() { // This's just for no errors (Expected Declaration)
        let checkNumber : Bool = checkIfUseableNumber()
        if checkNumber == true {
            let cows = checkCowsAndBulls().0 // cows
            let bulls = checkCowsAndBulls().1 // bulls
        }
    }

}
