//
//  ContentView.swift
//  UnitConverter
//
//  Created by Radu Petrisel on 05.07.2023.
//

import SwiftUI

struct ContentView: View {
    @State private var selectedSourceUnit = Unit.meters
    @State private var sourceValue = 0.0
    @State private var selectedDestinationUnit = Unit.kilometers
    
    private let availableSourceUnits = Unit.allCases
    
    private var availableDestinationUnits: [Unit] {
        availableSourceUnits.filter { $0.rawValue != selectedSourceUnit.rawValue }
    }
    
    private var destinationValue: Double {
        sourceValue * selectedSourceUnit.ratioToMeters / selectedDestinationUnit.ratioToMeters
    }
    
    var body: some View {
        Form {
            Section {
                TextField("Value", value: $sourceValue, format: .number)
                
                Picker("Unit", selection: $selectedSourceUnit) {
                    ForEach(availableSourceUnits, id: \.self) {
                        Text($0.rawValue)
                    }
                }
            } header: {
                Text("I want to convert")
            }
            
            Section {
                Picker("Unit", selection: $selectedDestinationUnit) {
                    ForEach(availableDestinationUnits, id: \.self) {
                        Text($0.rawValue)
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
