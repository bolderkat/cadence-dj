//
//  MenuOption.swift
//  Cadence DJ
//
//  Created by Daniel Luo on 8/15/25.
//

import Foundation

enum MenuOption: Int, Hashable, Identifiable, CaseIterable, Codable {
    case generatePlaylist
    case trackCadence

    var id: Int { rawValue }

    var localizedName: String {
        switch self {
        case .generatePlaylist:
            LocalizedStrings.Menu.generatePlaylist
        case .trackCadence:
            LocalizedStrings.Menu.trackCadence
        }
    }
}
