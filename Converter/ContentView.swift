//
//  ContentView.swift
//  Converter
//
//  Created by Иван Семикин on 02/09/2024.
//

import SwiftUI

import SwiftUI
import Foundation

struct ContentView: View {
    @State private var inputValue: Double = 0
    @State private var inputType: UnitLength = .meters
    @State private var outputType: UnitLength = .kilometers
    
    private let typesOfLengths: [UnitLength] = [.meters, .kilometers, .feet, .yards, .miles]
    
    // Computed property that handles conversion
    var convertedValue: Double {
        let inputMeasurement = Measurement(value: inputValue, unit: inputType)
        let outputMeasurement = inputMeasurement.converted(to: outputType)
        return outputMeasurement.value
    }
    
    var body: some View {
        NavigationStack {
            Form {
                Section("Enter The Value") {
                    TextField("Value", value: $inputValue, format: .number)
                        .keyboardType(.decimalPad)
                }
                
                Section {
                    Picker("Select Input Unit", selection: $inputType) {
                        ForEach(typesOfLengths, id: \.self) {
                            Text($0.symbol)
                        }
                    }
                    
                    Picker("Select Output Unit", selection: $outputType) {
                        ForEach(typesOfLengths, id: \.self) {
                            Text($0.symbol)
                        }
                    }
                }
                
                Section {
                    Text("Converted Value: \(convertedValue, format: .number) \(outputType.symbol)")
                }
            }
            .navigationTitle("Converter")
        }
    }
}

#Preview {
    ContentView()
}
