//
//  ImageButton.swift
//  AnimateYourPaint
//
//  Created by Dmitry Menkov on 04.11.2024.
//

import UIKit

protocol ImageButtonDelegate: AnyObject {
    func didTapInstrumentButton(type: InstrumentType)
    func didTapActionButton(type: ActionType)
}

protocol InstrumentButtonView: UIView {
    var delegate: ImageButtonDelegate? { get set }
    func selectType(_ type: InstrumentType)
}

class ImageButton: UIButton {
    init(image: UIImage?, isEnabled: Bool = true) {
        super.init(frame: .zero)
        setupConstraints()
        setupButtonStates(for: image)
        self.isEnabled = isEnabled
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }


    private func setupConstraints() {
        NSLayoutConstraint.activate([
            widthAnchor.constraint(equalToConstant: 32),
            heightAnchor.constraint(equalToConstant: 32)
        ])
    }

    private func setupButtonStates(for image: UIImage?) {
        setImage(image?.withTintColor(.whiteColor), for: .normal)
        setImage(image?.withTintColor(.greenColor), for: .selected)
        setImage(image?.withTintColor(.greenColor), for: .highlighted)
        setImage(image?.withTintColor(.grayColor), for: .disabled)
    }
}

final class InstrumentButton: ImageButton, InstrumentButtonView {
    private let type: InstrumentType
    weak var delegate: ImageButtonDelegate?

    init(image: UIImage?, type: InstrumentType, isEnabled: Bool = true) {
        self.type = type
        super.init(image: image, isEnabled: isEnabled)
        self.isEnabled = isEnabled

        addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }


    func selectType(_ type: InstrumentType) {
        isSelected = self.type == type
    }

    @objc private func buttonTapped() {
        delegate?.didTapInstrumentButton(type: type)
    }
}

protocol ActionButtonView: UIView {
    var delegate: ImageButtonDelegate? { get set }
    func selectType(_ type: ActionType)
}

final class ActionButton: ImageButton, ActionButtonView {
    private let type: ActionType
    weak var delegate: ImageButtonDelegate?

    init(image: UIImage?, type: ActionType, isEnabled: Bool = true) {
        self.type = type
        super.init(image: image, isEnabled: isEnabled)
        self.isEnabled = isEnabled

        addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }


    func selectType(_ type: ActionType) {
        isSelected = self.type == type
    }

    @objc private func buttonTapped() {
        delegate?.didTapActionButton(type: type)
    }
}
