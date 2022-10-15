//
//  IconDesign.swift
//  Calculator
//
//  Created by Fernando Zafe on 15/10/2022.
//

import SwiftUI

struct IconDesign: View {
    var body: some View {
        
        ZStack {
            Color(.black)
                .ignoresSafeArea()
            VStack{
                HStack{
                    CalculatorButton(zero: false, buttonText: "+", color: .orange)
                    CalculatorButton(zero: false, buttonText: "-", color: .orange)
                }
                HStack{
                    CalculatorButton(zero: false, buttonText: "x", color: .orange)
                    CalculatorButton(zero: false, buttonText: "/", color: .orange)
                }
            }
        }
    }
}

struct IconDesign_Previews: PreviewProvider {
    static var previews: some View {
        IconDesign()
        
    }
}
