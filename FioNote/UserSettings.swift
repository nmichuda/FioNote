//
//  UserSettings.swift
//  FioNote
//
//  Created by Nick Michuda on 4/11/25.
//

import Foundation
import SwiftUI


enum FontStyle: String, CaseIterable, Identifiable {
    case system
    case serif
    case monospace

    var id: String { rawValue }

    var font: Font {
        switch self {
        case .system:
            return .body
        case .serif:
            return .custom("Times New Roman", size: 16)
        case .monospace:
            return .system(.body, design: .monospaced)
        }
    }
}


class UserSettings: ObservableObject {
    @AppStorage("selectedColorRed") private var red: Double = 1.0
    @AppStorage("selectedColorGreen") private var green: Double = 1.0
    @AppStorage("selectedColorBlue") private var blue: Double = 1.0
    @AppStorage("selectedFont") var selectedFontRaw: String = FontStyle.system.rawValue

    var selectedColor: Color {
        get {
            Color(red: red, green: green, blue: blue)
        }
        set {
            var r: CGFloat = 1, g: CGFloat = 1, b: CGFloat = 1, a: CGFloat = 1
            UIColor(newValue).getRed(&r, green: &g, blue: &b, alpha: &a)
            red = r
            green = g
            blue = b
        }
    }

    var selectedFont: FontStyle {
        FontStyle(rawValue: selectedFontRaw) ?? .system
    }

    func setFont(_ font: FontStyle) {
        selectedFontRaw = font.rawValue
    }

    func setColor(_ color: Color) {
        selectedColor = color
    }
}
