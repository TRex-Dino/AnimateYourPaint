//
//  CustomIntensityVisualEffectView.swift
//  AnimateYourPaint
//
//  Created by Dmitry Menkov on 04.11.2024.
//

import UIKit

final class GradientView: UIView {
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        fatalError("init(coder:) has not been implemented")
    }

    private func setupView() {
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [
            UIColor.grayColor.cgColor,
            UIColor.lightGray.cgColor
        ]
        gradientLayer.startPoint = CGPoint(x: 0.5, y: 0)
        gradientLayer.endPoint = CGPoint(x: 0.5, y: 1)
        gradientLayer.frame = bounds
        gradientLayer.cornerRadius = 4
        gradientLayer.masksToBounds = true
        layer.insertSublayer(gradientLayer, at: 0)

        self.alpha = 0.7

        self.layer.borderColor = UIColor.lightGray.cgColor
        self.layer.borderWidth = 2
        self.layer.cornerRadius = 4
        self.layer.masksToBounds = true
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        if let gradientLayer = layer.sublayers?.first as? CAGradientLayer {
            gradientLayer.frame = bounds
        }
    }
}
