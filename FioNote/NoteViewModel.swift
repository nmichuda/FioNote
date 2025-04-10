//
//  NoteViewModel.swift
//  FioNote
//
//  Created by Nick Michuda on 4/10/25.
//

import Foundation

class NoteViewModel: ObservableObject {
    @Published var notes: [Note] = []

    func addNote(title: String, content: String) {
        let newNote = Note(title: title, content: content)
        notes.insert(newNote, at: 0)
    }

    func deleteNote(at offsets: IndexSet) {
        notes.remove(atOffsets: offsets)
    }
}
