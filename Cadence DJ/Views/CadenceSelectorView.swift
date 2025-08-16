//
//  CadenceSelectorView.swift
//  Cadence DJ
//
//  Created by Daniel Luo on 8/13/25.
//

import SwiftUI

struct CadenceSelectorView: View {
    @Binding var cadenceValue: Int
    @FocusState private var isFocused

    var body: some View {
        VStack(alignment: .center) {
            Text(LocalizedStrings.cadence)
                .bold()
                .font(.headline)

            textField

            Stepper(
                "",
                value: $cadenceValue,
                in: GlobalDefaults.cadenceRange
            )
            .labelsHidden()
            .accessibilityLabel(LocalizedStrings.cadenceStepper)
        }
    }

    private var textField: some View {
        TextField(
            "\(GlobalDefaults.defaultCadence)",
            value: $cadenceValue,
            format: .number.grouping(.never)
        )
        .bold()
        .font(.largeTitle)
        .monospaced()
        .multilineTextAlignment(.center)
        .keyboardType(.numberPad)
        .focused($isFocused)
        .toolbar {
            ToolbarItemGroup(placement: .keyboard) {
                KeyboardDoneToolbar {
                    isFocused = false
                    clampCadenceValue()
                }
            }
        }
        .onSubmit {
            clampCadenceValue()
        }
    }

    private func clampCadenceValue() {
        cadenceValue = cadenceValue.clamped(to: GlobalDefaults.cadenceRange)
    }
}

#Preview {
    CadenceSelectorView(cadenceValue: .constant(198))
}
