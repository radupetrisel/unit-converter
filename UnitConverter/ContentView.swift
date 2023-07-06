//
//  ContentView.swift
//  UnitConverter
//
//  Created by Radu Petrisel on 05.07.2023.
//

import SwiftUI

struct ContentView: View {
    @State private var selectedSourceUnit = UnitLength.meters
    @State private var sourceValue = 0.0
    @State private var selectedDestinationUnit = UnitLength.kilometers
    
    private let availableSourceUnits = [
        UnitLength.meters,
        UnitLength.kilometers,
        UnitLength.feet,
        UnitLength.miles,
        UnitLength.nauticalMiles
    ]
    
    private var availableDestinationUnits: [UnitLength] {
        availableSourceUnits.filter { $0 != selectedSourceUnit }
    }
    
    private var destinationValue: Double {
        Measurement(value: sourceValue, unit: selectedSourceUnit).converted(to: selectedDestinationUnit).value
    }
    
    var body: some View {
        Form {
            Section {
                TextField("Value", value: $sourceValue, format: .number)
                
                Picker("Unit", selection: $selectedSourceUnit) {
                    ForEach(availableSourceUnits, id: \.self) {
                        Text($0.symbol)
                    }
                }
            } header: {
                Text("I want to convert")
            }
            
            Section {
                Picker("Unit", selection: $selectedDestinationUnit) {
                    ForEach(availableDestinationUnits, id: \.self) {
                        Text($0.symbol)
                    }
                }
                
                Text(destinationValue, format: .number)
            } header: {
                Text("To")
            }
        }
        .onAppear {
            if (selectedDestinationUnit == selectedSourceUnit) {
                selectedDestinationUnit = availableDestinationUnits.first!
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
