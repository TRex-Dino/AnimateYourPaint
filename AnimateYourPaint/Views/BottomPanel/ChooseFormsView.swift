//
//  ChooseFormsView.swift
//  AnimateYourPaint
//
//  Created by Dmitry Menkov on 04.11.2024.
//

import UIKit

final class ChooseFormsView: UIView {
    private let blurEffectView = GradientView()
    private let squareButton = InstrumentButton(image: .square, type: .square)
    private let circleButton = InstrumentButton(image: .circle, type: .oval)
    private let trianleButton = InstrumentButton(image: .triangle, type: .triangle)
    private let arrowButton = InstrumentButton(image: .arrow, type: .arrow)
    private let formsStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.spacing = 16
        return stackView
    }()

    private var buttons: [InstrumentButtonView] {
        return [
            squareButton,
            circleButton,
            trianleButton,
            arrowButton
        ]
    }
    private var formType: InstrumentType = .brush

    init() {
        super.init(frame: .zero)
        setupView()
        isHidden = true
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

    func setInstrument(type: InstrumentType) {
        formType = type
        buttons.forEach { button in
            button.selectType(type)
        }
    }

    private func setupView() {
        layer.cornerRadius = 4
        layer.masksToBounds = true

        buttons.forEach { button in
            formsStackView.addArrangedSubview(button)
        }
        addSubviews(blurEffectView, formsStackView)

        NSLayoutConstraint.activate([
            blurEffectView.topAnchor.constraint(equalTo: topAnchor),
            blurEffectView.leftAnchor.constraint(equalTo: leftAnchor),
            blurEffectView.rightAnchor.constraint(equalTo: rightAnchor),
            blurEffectView.bottomAnchor.constraint(equalTo: bottomAnchor),

            formsStackView.topAnchor.constraint(equalTo: topAnchor),
            formsStackView.leftAnchor.constraint(equalTo: leftAnchor, constant: 16),
            formsStackView.rightAnchor.constraint(equalTo: rightAnchor, constant: -16),
            formsStackView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
}
