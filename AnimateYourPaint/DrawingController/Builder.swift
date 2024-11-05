//
//  Builder.swift
//  AnimateYourPaint
//
//  Created by Dmitry Menkov on 04.11.2024.
//

import UIKit

final class Builder {
    func makeDrawingViewController() -> UIViewController {
        let presenter = DrawingPresenter()
        let view = DrawingViewController(presenter: presenter)
        presenter.view = view
        return view
    }
}
