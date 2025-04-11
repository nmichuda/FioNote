//
//  SettingsView.swift
//  FioNote
//
//  Created by Nick Michuda on 4/11/25.
//

import SwiftUI

struct SettingsView: View {
    @ObservedObject var userSettings: UserSettings

    let colors: [Color] = [.white, .yellow, .mint, .gray.opacity(0.2)]

    var body: some View {
        Form {
            Section(header: Text("Background Color")) {
                HStack {
                    ForEach(colors, id: \.self) { color in
                        Circle()
                            .fill(color)
                            .frame(width: 30, height: 30)
                            .onTapGesture {
                                userSettings.selectedColor = color
                            }
                            .overlay(
                                Circle().stroke(Color.black, lineWidth: userSettings.selectedColor == color ? 2 : 0)
                            )
                    }
                }
            }

            Section(header: Text("Font Style")) {
                Picker("Font", selection: $userSettings.selectedFontRaw) {
                    ForEach(FontStyle.allCases) { style in
                        Text(style.rawValue.capitalized).tag(style.rawValue)
                    }
                }
                .pickerStyle(SegmentedPickerStyle())
            }
        }
        .navigationTitle("Settings")
    }
}
