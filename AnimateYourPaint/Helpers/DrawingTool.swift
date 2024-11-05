//
//  DrawingTool.swift
//  AnimateYourPaint
//
//  Created by Dmitry Menkov on 04.11.2024.
//

import UIKit

enum DrawingTool {
    case pencil, brush, erase, square, oval, triangle, arrow
    case instruments, colorPalette

    var image: UIImage? {
        switch self {
        case .pencil: return UIImage(named: "Pencil")
        case .brush: return UIImage(named: "brush")
        case .erase: return UIImage(named: "Erase")
        case .square: return UIImage(named: "Square")
        case .oval: return UIImage(named: "Circle")
        case .triangle: return UIImage(named: "Triangle")
        case .arrow: return UIImage(named: "Arrow")
        case .instruments: return UIImage(named: "Instruments")
        case .colorPalette: return UIImage(named: "colorPalette")
        }
    }
}
