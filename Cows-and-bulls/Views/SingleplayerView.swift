//
//  SingleplayerView.swift
//  Cows-and-bulls
//
//  Created by Aarni on 14.8.2022.
//

import SwiftUI
import Combine


struct StoredResult : Identifiable {
    let result: String
    let id = UUID()
}

struct SingleplayerView: View {
    @State var input: String = ""
    @State var output: String = ""
    @State var results: [StoredResult] = []
    @State var buttonIsDisabled: Bool = true

    let guessLimit = 4
    var guess = ""
    let randomNumber = generateRandomNumber()

    var body: some View {
        VStack {
            TextField("Enter your guess", text: $input, prompt: Text("Enter your guess"))
                .textFieldStyle(.roundedBorder)
                .font(.callout)
                .padding()
                .frame(maxWidth: 200)
                .cornerRadius(40)
                .keyboardType(.decimalPad)
                .onReceive(Just(input)) { _ in limitText() }

            Button(action: check) {
                Text("Guess")
                    .foregroundColor(.black)
                    // .fontWeight(.bold)
                    .padding(10)
                    .frame(width: 100)
                    .background(buttonIsDisabled ? Color.gray : Color.blue)
                    .cornerRadius(20)

             }.disabled(buttonIsDisabled)

            List(results) {
                Text($0.result)
            }

        }
    }

    func limitText() { // This funcgion can be proved
        // if not number, then, don't add it to textfield

        input = input.filter("0123456789".contains)
        
        let usersGuess = input
        let uniqueNumbers = Set(usersGuess)

        if input.count > guessLimit {
            input = String(input.prefix(guessLimit))
        }

        if input.starts(with: "0") {
            input = String(input.prefix(0))
        }

        if usersGuess.count != uniqueNumbers.count {
            input = String(input.prefix(uniqueNumbers.count))
        }

        if uniqueNumbers.count == 4 {
            buttonIsDisabled = false
        } else {
            buttonIsDisabled = true
        }

    }

    func clearInput() {
        input = ""
    }
    
    func check() {

        let usersInput = input.digits
        if (checkUsersInput(usersInput: usersInput)) {

            let cows = checkCowsAndBulls(usersInput: usersInput).0
            let bulls = checkCowsAndBulls(usersInput: usersInput).1

            let hint = "\(input)  |  \(cows) Cows, \(bulls) Bulls"

            results.append(StoredResult(result: hint))

        } else {
            let cows = checkCowsAndBulls(usersInput: usersInput).0
            let bulls = checkCowsAndBulls(usersInput: usersInput).1

            let hint = "\(input)  |  \(cows) Cows, \(bulls) Bulls"

            results.append(StoredResult(result: hint))

        }

        if checkCowsAndBulls(usersInput: usersInput).bulls == 4 {
            output = "Game over!"
            results.append(StoredResult(result: output))
            // adds pop up to ask what to do (restart )
            // print titled text "You won" and game over under it.
        }

        clearInput()

    }

    static func generateRandomNumber() -> [Int] {

        var numberSet = [Int]()

        numberSet.append(Int.random(in:1...9))

        while (numberSet.count <= 3) {
            let randomNumber = Int.random(in: 0...9)

            if (!numberSet.contains(randomNumber)) {
                numberSet.append(randomNumber)
            }
        }

        return numberSet
    }

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
}
