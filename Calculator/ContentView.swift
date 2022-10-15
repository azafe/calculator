//
//  ContentView.swift
//  Calculator
//
//  Created by Fernando Zafe on 12/10/2022.
//

import SwiftUI

enum CalculatorMode {
    case notSet
    case addition
    case substraction
    case multiplication
}

struct ContentView: View {
    @State var currentValue: String = "0"
    @State var currentMode: CalculatorMode = .notSet
    @State var lastButtonWasMode: Bool = false
    @State var savedValue: Int = 0
    @State var currentValueInt: Int = 0
    var body: some View {
        ZStack {
            Color(.black)
            VStack(spacing:20){
                HStack {
                    Spacer()
                    TotalTextView(value: currentValue)
                        .padding(.horizontal,20)
                }
                HStack(spacing:15){
                    CalculatorButton(buttonText: "AC", action: didPressClear)
                    CalculatorButton(buttonText: "+/-", action: didPressNumber)
                    CalculatorButton(buttonText: "%", action: didPressNumber)
                    CalculatorButton(buttonText: "/", color: .orange, action: didPressMode)
                }
                HStack(spacing:15){
                    CalculatorButton(buttonText: "7", action: didPressNumber)
                    CalculatorButton(buttonText: "8", action: didPressNumber)
                    CalculatorButton(buttonText: "9", action: didPressNumber)
                    CalculatorButton(buttonText: "+", color: .orange, action: didPressMode, mode: .addition)
                }
                HStack(spacing:15){
                    CalculatorButton(buttonText: "4", action: didPressNumber)
                    CalculatorButton(buttonText: "5", action: didPressNumber)
                    CalculatorButton(buttonText: "6", action: didPressNumber)
                    CalculatorButton(buttonText: "-", color: .orange, action: didPressMode, mode: .substraction)
                }
                HStack(spacing:15){
                    CalculatorButton(buttonText: "1", action: didPressNumber)
                    CalculatorButton(buttonText: "2", action: didPressNumber)
                    CalculatorButton(buttonText: "3", action: didPressNumber)
                    CalculatorButton(buttonText: "X", color: .orange, action: didPressMode, mode: .multiplication)
                }
                HStack(spacing:15){
                    CalculatorButton(zero: true, buttonText: "0",action: didPressNumber )
                    CalculatorButton(buttonText: ",", action: didPressNumber)
                    CalculatorButton(buttonText: "=", color: .orange, action: didPressEquals)
                }
                
            }
        }.ignoresSafeArea()
     
        
    }
    
    func didPressNumber(button: CalculatorButton){
        if lastButtonWasMode{
            lastButtonWasMode = false
            currentValueInt = 0
        }
        
        if let parsedValue = Int("\(currentValueInt)" + button.buttonText) {
            currentValueInt = parsedValue
            updateText()
            
        } else {
            currentValue = "Error"
            currentValueInt = 0
        }
    }
    
    func didPressMode(button: CalculatorButton){
        currentMode = button.mode
        lastButtonWasMode = true
    }
    
    func didPressEquals(button: CalculatorButton){
        if currentMode == .notSet || lastButtonWasMode{
            return
        }
        
        if currentMode == .addition {
            savedValue += currentValueInt
        }
        else if currentMode == .multiplication {
            savedValue *= currentValueInt
        }
        else if currentMode == .substraction {
            savedValue -= currentValueInt
        }
        
        currentValueInt = savedValue
        updateText()
        lastButtonWasMode = true
        
        
    }
    
    func didPressClear(button: CalculatorButton){
        currentMode = .notSet
        savedValue = 0
        currentValueInt = 0
        lastButtonWasMode = false
        currentValue = "\(currentValueInt)"
    }
    
    func updateText() {
        if currentMode == .notSet {
            savedValue = currentValueInt
        }
        
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .decimal
        numberFormatter.groupingSeparator = "."
        let num = NSNumber(value: currentValueInt)
        
        currentValue = numberFormatter.string(from: num) ?? "Error"
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
