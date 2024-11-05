//
//  InstrumentType.swift
//  AnimateYourPaint
//
//  Created by Dmitry Menkov on 04.11.2024.
//

import Foundation

enum InstrumentType {
    case pencil, brush, erase, square, oval, triangle, arrow
    case instruments, colorPalette, colors
}

enum ActionType {
    case play, layers, newLayer, redo, undo, stop, trash
}
