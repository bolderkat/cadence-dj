//
//  KeyboardDoneToolbar.swift
//  Cadence DJ
//
//  Created by Daniel Luo on 8/13/25.
//

import SwiftUI

struct KeyboardDoneToolbar: View {
    var onDoneTapped: () -> Void

    var body: some View {
        HStack {
            Spacer()
            Button(LocalizedStrings.done) {
                onDoneTapped()
            }
        }
    }
}

#Preview {
    KeyboardDoneToolbar(onDoneTapped: {})
}
