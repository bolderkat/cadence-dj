//
//  LocalizedStrings.swift
//  Cadence DJ
//
//  Created by Daniel Luo on 8/13/25.
//

import Foundation

enum LocalizedStrings {
    static let cadence = NSLocalizedString(
        "Cadence",
        comment: "Title label for the text field indicating the user's selected running/cycling cadence."
    )

    static let cadenceStepper = NSLocalizedString(
        "Cadence Stepper",
        comment: "Label for the stepper that allows the user to adjust the cadence."
    )

    static let done = NSLocalizedString(
        "Done",
        comment: "Button title to complete a flow."
    )

    enum Menu {
        static let generatePlaylist = NSLocalizedString(
            "Generate playlist",
            comment: "Menu item title to generate a playlist based on the selected cadence."
        )

        static let trackCadence = NSLocalizedString(
            "Track cadence",
            comment: "Menu item title to track the user's cadence while running or cycling."
        )

        static let placeholder = NSLocalizedString(
            "Select a menu option",
            comment: "Text displayed if detail view is visible with no menu option selected."
        )
    }
}
