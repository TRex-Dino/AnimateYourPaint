//
//  InstrumentsPanelView.swift
//  AnimateYourPaint
//
//  Created by Dmitry Menkov on 04.11.2024.
//

import Foundation
import UIKit

protocol InstrumentsActionDelegate: AnyObject {
    func didTapButton(type: InstrumentType)
}

final class InstrumentsPanelView: UIView {
    private let leftBlockView = UIView()
    private let centerBlockView = UIView()
    private let rightBlockView = UIView()

    private let undoButton = ActionButton(image: .undo, type: .undo, isEnabled: false)
    private let redoButton = ActionButton(image: .redo, type: .redo, isEnabled: false)
    private let trashButton = ActionButton(image: .trash, type: .trash, isEnabled: false)
    private let newLayerButton = ActionButton(image: .newLayer, type: .newLayer)
    private let layersButton = ActionButton(image: .layers, type: .layers)
    private let stopButton = ActionButton(image: .stop, type: .stop, isEnabled: false)
    private let playButton = ActionButton(image: .play, type: .play, isEnabled: false)
    private var buttons: [ActionButtonView] {
        return [
            undoButton,
            redoButton,
            trashButton,
            newLayerButton,
            layersButton,
            stopButton,
            playButton,
        ]
    }
    init() {
        super.init(frame: .zero)

        setupView()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func setButtonsDelegate(_ delegate: ImageButtonDelegate?) {
        buttons.forEach { button in
            button.delegate = delegate
        }
    }

    private func setupView() {
        addSubviews(leftBlockView, centerBlockView, rightBlockView)

        leftBlockView.addSubviews(undoButton, redoButton)
        centerBlockView.addSubviews(trashButton, newLayerButton, layersButton)
        rightBlockView.addSubviews(stopButton, playButton)

        NSLayoutConstraint.activate([
            leftBlockView.leftAnchor.constraint(equalTo: safeAreaLayoutGuide.leftAnchor, constant: 16),
            leftBlockView.topAnchor.constraint(equalTo: topAnchor),
            leftBlockView.bottomAnchor.constraint(equalTo: bottomAnchor),

            centerBlockView.leftAnchor.constraint(equalTo: leftBlockView.rightAnchor, constant: 16),
            centerBlockView.topAnchor.constraint(equalTo: topAnchor),
            centerBlockView.bottomAnchor.constraint(equalTo: bottomAnchor),
            centerBlockView.rightAnchor.constraint(equalTo: rightBlockView.leftAnchor, constant: -16),

            rightBlockView.topAnchor.constraint(equalTo: topAnchor),
            rightBlockView.bottomAnchor.constraint(equalTo: bottomAnchor),
            rightBlockView.rightAnchor.constraint(equalTo: safeAreaLayoutGuide.rightAnchor, constant: -8),

            undoButton.leftAnchor.constraint(equalTo: leftBlockView.leftAnchor),
            undoButton.centerYAnchor.constraint(equalTo: leftBlockView.centerYAnchor),

            redoButton.leftAnchor.constraint(equalTo: undoButton.rightAnchor, constant: 8),
            redoButton.centerYAnchor.constraint(equalTo: leftBlockView.centerYAnchor),
            redoButton.rightAnchor.constraint(equalTo: leftBlockView.rightAnchor),

            trashButton.leftAnchor.constraint(greaterThanOrEqualTo: centerBlockView.leftAnchor),
            trashButton.centerYAnchor.constraint(equalTo: centerBlockView.centerYAnchor),
            trashButton.rightAnchor.constraint(equalTo: newLayerButton.leftAnchor, constant: -16),

            newLayerButton.centerYAnchor.constraint(equalTo: centerBlockView.centerYAnchor),
            newLayerButton.centerXAnchor.constraint(equalTo: centerBlockView.centerXAnchor),

            layersButton.leftAnchor.constraint(equalTo: newLayerButton.rightAnchor, constant: 16),
            layersButton.centerYAnchor.constraint(equalTo: centerBlockView.centerYAnchor),
            layersButton.rightAnchor.constraint(lessThanOrEqualTo: centerBlockView.rightAnchor),

            stopButton.leftAnchor.constraint(equalTo: rightBlockView.leftAnchor),
            stopButton.centerYAnchor.constraint(equalTo: rightBlockView.centerYAnchor),

            playButton.leftAnchor.constraint(equalTo: stopButton.rightAnchor, constant: 16),
            playButton.centerYAnchor.constraint(equalTo: rightBlockView.centerYAnchor),
            playButton.rightAnchor.constraint(equalTo: rightBlockView.rightAnchor)
        ])
    }
}
