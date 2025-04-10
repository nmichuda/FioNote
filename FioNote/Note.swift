//
//  Note.swift
//  FioNote
//
//  Created by Nick Michuda on 4/10/25.
//

import Foundation
import SwiftUI

struct Note: Identifiable, Codable {
    let id: UUID
    var title: String
    var content: String
    var createdAt: Date

    init(title: String, content: String) {
        self.id = UUID()
        self.title = title
        self.content = content
        self.createdAt = Date()
    }
}
