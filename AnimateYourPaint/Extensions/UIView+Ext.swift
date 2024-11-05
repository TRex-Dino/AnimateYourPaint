//
//  UIView+Ext.swift
//  AnimateYourPaint
//
//  Created by Dmitry Menkov on 04.11.2024.
//

import UIKit

extension UIView {
    func addSubviews(_ views: UIView...) {
        views.forEach { view in
            self.addSubview(view)
            view.translatesAutoresizingMaskIntoConstraints = false
        }
    }
}
