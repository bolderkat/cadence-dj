//
//  CadenceSelectorView.swift
//  Cadence DJ
//
//  Created by Daniel Luo on 8/13/25.
//

import SwiftUI

struct CadenceSelectorView: View {
    private enum Constants {
        static let defaultValue = 170
        static let range = 100...250
    }

    @State private var cadenceValue = Constants.defaultValue // TODO: pass in from above
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
                in: Constants.range
            )
            .labelsHidden()
            .accessibilityLabel(LocalizedStrings.cadenceStepper)
        }
    }

    private var textField: some View {
        TextField(
            "\(Constants.defaultValue)",
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
        cadenceValue = cadenceValue.clamped(to: Constants.range)
    }
}

#Preview {
    CadenceSelectorView()
}
