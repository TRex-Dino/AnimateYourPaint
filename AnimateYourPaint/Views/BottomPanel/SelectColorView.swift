//
//  SelectColorView.swift
//  AnimateYourPaint
//
//  Created by Dmitry Menkov on 04.11.2024.
//

import UIKit

final class SelectColorView: UIView, InstrumentButtonView {
    private let circleView = UIView()
    weak var delegate: ImageButtonDelegate?

    init() {
        super.init(frame: .zero)
        setupView()
        let tap = UITapGestureRecognizer(target: self, action: #selector(buttonTapped))
        addGestureRecognizer(tap)
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func setupView(color: UIColor, isSelected: Bool) {
        circleView.backgroundColor = color
        if isSelected {
            circleView.layer.borderColor = UIColor.greenColor.cgColor
        } else {
            circleView.layer.borderColor = UIColor.clear.cgColor
        }
    }

    func selectType(_ type: InstrumentType) {
        if type == .colors {
            circleView.layer.borderColor = UIColor.greenColor.cgColor
        } else {
            circleView.layer.borderColor = UIColor.clear.cgColor
        }
    }

    private func setupView() {
        addSubviews(circleView)

        NSLayoutConstraint.activate([
            widthAnchor.constraint(equalToConstant: 32),
            heightAnchor.constraint(equalToConstant: 32),

            circleView.centerXAnchor.constraint(equalTo: centerXAnchor),
            circleView.centerYAnchor.constraint(equalTo: centerYAnchor),
            circleView.widthAnchor.constraint(equalToConstant: 28),
            circleView.heightAnchor.constraint(equalToConstant: 28),
        ])

        circleView.backgroundColor = .blueColor
        circleView.layer.cornerRadius = 28/2
        circleView.layer.borderWidth = 2
    }

    @objc private func buttonTapped() {
        delegate?.didTapInstrumentButton(type: .colors)
    }
}
