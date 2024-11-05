//
//  File.swift
//  AnimateYourPaint
//
//  Created by Dmitry Menkov on 04.11.2024.
//

import UIKit

protocol ObjectPainter {
    var instrument: DrawInstrument { get }
    var color: UIColor { get }
    var lineWidth: CGFloat { get }
    var position: CGPoint { get }
    var rotate: CGFloat { get }
    var scale: CGPoint { get }

    func makeImage(on canvasSize: CanvasSize, from image: UIImage?) -> UIImage
}


protocol EditableObjectPainter: ObjectPainter {
    var color: UIColor { get set }
    var lineWidth: CGFloat { get set }
    var position: CGPoint { get set }
    var rotate: CGFloat { get set }
    var scale: CGPoint { get set }

    mutating func clean()
    mutating func movePoint(_ point: CGPoint, initialPoint: CGPoint)
}

protocol OptimizeLayoutObjectPainter {
    func fillLayer(_ drawLayer: CAShapeLayer)
    func layerFrame() -> CGRect
}

protocol EditableFigurePainter: EditableObjectPainter {
    var fillColor: UIColor { get set }
}
