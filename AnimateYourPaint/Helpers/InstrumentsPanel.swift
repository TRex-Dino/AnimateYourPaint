//
//  InstrumentsPanel.swift
//  AnimateYourPaint
//
//  Created by Dmitry Menkov on 04.11.2024.
//


import UIKit

enum InstrumentsPanel {
    case play, layers, newLayer, redo, undo, stop, trash

    var image: UIImage? {
        switch self {
        case .play: return UIImage(named: "Play")
        case .layers: return UIImage(named: "Layers")
        case .newLayer: return UIImage(named: "NewLayer")
        case .redo: return UIImage(named: "Redo")
        case .undo: return UIImage(named: "Undo")
        case .stop: return UIImage(named: "Stop")
        case .trash: return UIImage(named: "Trash")
        }
    }
}
