//
//  ButtonNumber.swift
//  Calculator
//
//  Created by Fernando Zafe on 12/10/2022.
//

import SwiftUI

struct CalculatorButton: View {
    var zero: Bool = false
    var buttonText: String = "0"
    var color: Color = Color(hue: 1, saturation: 0, brightness: 0.283)
    var action: (CalculatorButton) -> Void = {_ in }
    var mode: CalculatorMode = .notSet
    var body: some View {
        if zero
        {
            Button {
                action(self)
            } label: {
                Text(buttonText)
                    .foregroundColor(.white)
                    .font(.largeTitle)
                    .frame(width: 100, height: 70, alignment: .leading)
                    .padding(.horizontal,30)
                    .background(color)
                    .foregroundColor(.white)
                    .clipShape(RoundedRectangle(cornerRadius: 50))
            }

            
        } else
            {
            Button {
                action(self)
                
            } label: {
                Text(buttonText)
                    .foregroundColor(.white)
                    .font(.largeTitle)
                    .frame(width: 70, height: 70, alignment: .center)
                    .background(color)
                    .foregroundColor(.white)
                    .clipShape(RoundedRectangle(cornerRadius: 50))
            }

    
        }

      
        
    }
 
    
}

struct ButtonNumber_Previews: PreviewProvider {
    static var previews: some View {
        CalculatorButton()
    }
}
