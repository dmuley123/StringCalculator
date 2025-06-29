//
//  ContentView.swift
//  StringCalculator
//
//  Created by Dnyaneshwar Muley on 28/06/25.
//

import SwiftUI

struct StringCalculatorView: View {
    @State private var input = ""
    @State private var result: String = ""
    
    var body: some View {
        VStack(spacing: 20) {
            
            Spacer()
            
            Text("String Calculator")
                .font(.largeTitle.bold())
            
            TextField("Enter numbers (e.g. 1,2)", text: $input)
                .textFieldStyle(.roundedBorder)
                .padding()
            
            Button("Calculate") {
                print("result: \(input)")
                do {
                    let calc = StringCalculator()
                    let value = try calc.add(input)
                    result = "Result: \(value)"
                } catch {
                    result = error.localizedDescription
                }
            }
            .buttonStyle(.borderedProminent)
            
            Text(result)
                .font(.headline)
                .padding()
            
            Spacer()
        }
        .padding()
    }
}
