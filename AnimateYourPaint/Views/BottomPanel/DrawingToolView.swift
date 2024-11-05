//
//  DrawingToolView.swift
//  AnimateYourPaint
//
//  Created by Dmitry Menkov on 04.11.2024.
//

import UIKit

final class DrawingToolView: UIView {
    private let pencilButton = InstrumentButton(image: .pencil, type: .pencil)
    private let brushButton = InstrumentButton(image: .brush, type: .brush)
    private let eraseButton = InstrumentButton(image: .erase, type: .erase)
    private let formsView = InstrumentButton(image: .instruments, type: .instruments)
    private let selectColorView = SelectColorView()

    private let toolsStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.spacing = 16
        return stackView
    }()
    private var buttons: [InstrumentButtonView] {
        return [
            pencilButton,
            brushButton,
            eraseButton,
            formsView,
            selectColorView
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

    func setState(_ enable: Bool) {
        // disable/enable all buttons
        // selectColorView // ∆ what to do?
    }

    func selectInstrument(_ type: InstrumentType) {
        buttons.forEach { button in
            button.selectType(type)
        }
    }

    private func setupView() {
        buttons.forEach { button in
            toolsStackView.addArrangedSubview(button)
        }
        addSubviews(toolsStackView)

        NSLayoutConstraint.activate([
            toolsStackView.leftAnchor.constraint(equalTo: leftAnchor),
            toolsStackView.rightAnchor.constraint(equalTo: rightAnchor),
            toolsStackView.topAnchor.constraint(equalTo: topAnchor),
            toolsStackView.bottomAnchor.constraint(equalTo: bottomAnchor),
        ])
    }
}
