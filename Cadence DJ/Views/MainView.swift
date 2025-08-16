//
//  MainView.swift
//  Cadence DJ
//
//  Created by Daniel Luo on 8/13/25.
//

import SwiftUI

struct MainView: View {
    @State private var selectedCadence: Int = GlobalDefaults.defaultCadence
    @State private var selectedMenuOption: MenuOption? // TODO: move to NavigationModel
    private let menuOptions = MenuOption.allCases

    var body: some View {
        NavigationSplitView {
            VStack {
                CadenceSelectorView(cadenceValue: $selectedCadence)
                .padding()

                List(
                    menuOptions,
                    selection: $selectedMenuOption
                ) { menuOption in
                    NavigationLink(menuOption.localizedName, value: menuOption)
                }
                .scrollContentBackground(.hidden)
            }
        } detail: {
            if let selectedMenuOption {
                // TODO: replace with real views
                VStack {
                    Text(selectedMenuOption.localizedName)
                    Text("Current cadence: \(selectedCadence)")
                }
            } else {
                Text(LocalizedStrings.Menu.placeholder)
            }
        }

    }
}

#Preview {
    MainView()
}
