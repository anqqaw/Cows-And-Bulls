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
    var guess = ""
    let randomNumber = generateRandomNumber()

    var body: some View {
        VStack {

            // USE TABVIEW OR CONSIDER ABT IT
            // restart button
            // use "input" for users input
            TextField("Enter your guess", text: $input, prompt: Text("Guess"))
                .textFieldStyle(.roundedBorder)
                .font(.callout)
                .padding()
                .frame(maxWidth: 200)
                .cornerRadius(40)
                .keyboardType(.decimalPad)

            // Button(action: guess)
            Button(action: check) {
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
    
    func check() {
        print(input)
        
        let usersInput = input.digits
        if (checkUsersInput(usersInput: usersInput)) {
            print("OK")
        } else {
            print("Not ok")
        }
        
        if checkCowsAndBulls(usersInput: usersInput).bulls == 4 {
            print("WON")
        }
    }

    static func generateRandomNumber() -> [Int] {

        var numberSet = [Int]()

        while (numberSet.count <= 3) {
            let randomNumber = Int.random(in: 0...9)

            if (!numberSet.contains(randomNumber)) {
                numberSet.append(randomNumber)
            }
        }

        return numberSet
    }

//    let usersInput = guess.digits
    // let usersInput: [Int] = [1, 1, 6, 5] // no input if invalid

    func checkUsersInput(usersInput: [Int]) -> Bool {
        if (usersInput.count != 4) {
            return false
        }
 
        for i in 0...3 {
           for j in 0...3 {
               if (i != j) && (usersInput[i] == usersInput[j]) {
                   return false
               }
           }
        }
        return true
    }

//    let randomNumber = generateRandomNumber()
//    let check = checkSimilarity()

    func checkIfUseableNumber() -> Bool {
//        if (!usersInput.isEmpty) && (!usersInput.contains(0)) && (!check) {
//            return true
//        }
//        else {
//            return false
//        }
        return false
    }

    func checkCowsAndBulls(usersInput: [Int]) -> (cows: Int, bulls: Int) {

        let check = checkUsersInput(usersInput: usersInput)
        var cows_count: Int = 0
        var bulls_count: Int = 0

        if check == true {

            for i in 0...3 {
                for j in 0...3 {

                    if usersInput[i] == randomNumber[j] {
                        cows_count += 1
                    }
                }
                if Int(usersInput[i]) == randomNumber[i] {
                    bulls_count += 1
                }
            }

            if bulls_count > 0 {
                cows_count -= bulls_count
            }
        }
        return (cows_count, bulls_count)
    }
    
    func theCheck() { // This's just for no errors (Expected Declaration)
//        let checkNumber : Bool = checkIfUseableNumber()
//        if checkNumber == true {
//            let cows = checkCowsAndBulls().0 // cows
//            let bulls = checkCowsAndBulls().1 // bulls
//        }
    }

}
