//
//  ContentView.swift
//  FioNote
//
//  Created by Nick Michuda on 4/10/25.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var viewModel = NoteViewModel()
    @StateObject private var userSettings = UserSettings()

    @State private var showingAddNote = false
    @State private var showingSettings = false

    var body: some View {
        NavigationView {
            List {
                ForEach(viewModel.notes) { note in
                    VStack(alignment: .leading) {
                        Text(note.title)
                            .font(userSettings.selectedFont.font.weight(.bold))
                        Text(note.content)
                            .font(userSettings.selectedFont.font)
                            .foregroundColor(.secondary)
                    }
                    .padding(5)
                }
                .onDelete(perform: viewModel.deleteNote)
            }
            .background(userSettings.selectedColor)
            .navigationTitle("Fionote")
            .toolbar {
                ToolbarItemGroup(placement: .primaryAction) {
                    Button(action: {
                        showingSettings = true
                    }) {
                        Image(systemName: "gearshape")
                    }

                    Button(action: {
                        showingAddNote = true
                    }) {
                        Image(systemName: "plus")
                    }
                }
            }
            .sheet(isPresented: $showingAddNote) {
                AddNoteView(viewModel: viewModel)
            }
            .sheet(isPresented: $showingSettings) {
                SettingsView(userSettings: userSettings)
            }
        }
    }
}
