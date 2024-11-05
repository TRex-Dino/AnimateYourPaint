//
//  DrawingPresenter.swift
//  AnimateYourPaint
//
//  Created by Dmitry Menkov on 04.11.2024.
//

import Foundation


protocol DrawingPresenterProtocol: ImageButtonDelegate, CanvasViewDelegate {

}

final class DrawingPresenter {
    weak var view: DrawingView?
    private var canvas = Canvas()

}

extension DrawingPresenter: DrawingPresenterProtocol {
    private func updateUI() {
        updateColors()
//        view.canvas.instrument = view.draw.selectedInstrument

//        if view.draw.selectedInstrument == .erase { // Чтобы стирать было удобней, пока нет выбора ширины.
//            view.canvas.width = view.draw.selectedWidth * 2
//        } else {
//            view.canvas.width = view.draw.selectedWidth
//        }



//        if view.action.framesIsShown {
//            view.frames.update(recordOfFrames: canvas.anyRecords, canvasSize: view.canvas.canvasSize)
//            view.frames.selectedFrameIndex = canvas.currentFrameIndex
//        }

//        view.draw.setEnable(!isPlaying)

//        updateAvailableActions()
    }

    private func updateColors() {
        // colorPickerPresenter.currentColor - это считается основным, от него цвет раскидываем в другие места.

//        view.canvas.color = colorPickerPresenter.currentColor
//        view.draw.selectedColor = colorPickerPresenter.currentColor
//        view.draw.shownColors = colorPickerPresenter.colorHistory
    }

    func updateInstrumentAction(with type: InstrumentType) {
        var showFromsView = false
        var typeInForms = type

        switch type {
        case .pencil:
            view?.setInstrumentForChooseForm(type)
        case .brush:
            view?.setInstrumentForChooseForm(type)
        case .erase:
            view?.setInstrumentForChooseForm(type)
        case .square:
            typeInForms = .instruments
            view?.setInstrumentForChooseForm(.square)
        case .oval:
            typeInForms = .instruments
            view?.setInstrumentForChooseForm(.oval)
        case .triangle:
            typeInForms = .instruments
            view?.setInstrumentForChooseForm(.triangle)
        case .arrow:
            typeInForms = .instruments
            view?.setInstrumentForChooseForm(.arrow)
        case .instruments:
            showFromsView = true
            typeInForms = .instruments
        case .colorPalette:
            break
        case .colors:
            break
        }

        view?.formsViewIsHidden(!showFromsView)
        view?.updateInstrument(type: type)

        view?.selectInstrument(typeInForms)
    }
}

extension DrawingPresenter {
    func didTapInstrumentButton(type: InstrumentType) {
        updateInstrumentAction(with: type)
    }
    
    func didTapActionButton(type: ActionType) {

    }

    func newRecord(_ frame: Canvas.Record) {
        canvas.currentFrame.addRecord(frame)
        view?.updateFrames(prevFrame: canvas.prevFrame?.currentRecord, currentFrame: canvas.currentFrame.currentRecord)
    }
}
