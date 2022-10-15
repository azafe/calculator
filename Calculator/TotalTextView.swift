//
//  TotalTextView.swift
//  Calculator
//
//  Created by Fernando Zafe on 12/10/2022.
//

import SwiftUI

struct TotalTextView: View {
    var value: String = "0"
    var body: some View {
        Text(value)
            .font(.system(size: 60))
            .fontWeight(.bold)
            .foregroundColor(.white)
            .padding()
            .lineLimit(1)
    }
}

struct TotalTextView_Previews: PreviewProvider {
    static var previews: some View {
        TotalTextView()
            .background(.black)
    }
}
