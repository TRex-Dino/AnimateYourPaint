
import UIKit

protocol DrawingView: AnyObject {
    func updateFrames(prevFrame: Canvas.Record?, currentFrame: Canvas.Record?)
    func updateInstrument(type: InstrumentType)
    func formsViewIsHidden(_ isHidden: Bool)
    func setInstrumentForChooseForm(_ type: InstrumentType)
    func selectInstrument(_ type: InstrumentType)
}

final class DrawingViewController: UIViewController {
    private let instrumentsPanelView = InstrumentsPanelView()
    private let drawingToolView = DrawingToolView()
    private let chooseFormsView = ChooseFormsView()
    private let canvasView = CanvasView()

    private let presenter: DrawingPresenterProtocol

    init(presenter: DrawingPresenterProtocol) {
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setDelegates()
    }

    private func setupView() {
        view.backgroundColor = .blackColor

        view.addSubviews(canvasView, instrumentsPanelView, drawingToolView, chooseFormsView)

        let safeAreaLayoutGuide = view.safeAreaLayoutGuide
        NSLayoutConstraint.activate([
            instrumentsPanelView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 16),
            instrumentsPanelView.leftAnchor.constraint(equalTo: safeAreaLayoutGuide.leftAnchor),
            instrumentsPanelView.rightAnchor.constraint(equalTo: safeAreaLayoutGuide.rightAnchor),
            instrumentsPanelView.heightAnchor.constraint(equalToConstant: 32),

            canvasView.topAnchor.constraint(equalTo: instrumentsPanelView.bottomAnchor, constant: 32),
            canvasView.leftAnchor.constraint(equalTo: safeAreaLayoutGuide.leftAnchor),
            canvasView.rightAnchor.constraint(equalTo: safeAreaLayoutGuide.rightAnchor),
            canvasView.bottomAnchor.constraint(equalTo: drawingToolView.topAnchor, constant: -32),

            chooseFormsView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            chooseFormsView.heightAnchor.constraint(equalToConstant: 56),
            chooseFormsView.bottomAnchor.constraint(equalTo: drawingToolView.topAnchor, constant: -16),

            drawingToolView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            drawingToolView.heightAnchor.constraint(equalToConstant: 32),
            drawingToolView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -16),
        ])
    }

    private func setDelegates() {
        instrumentsPanelView.setButtonsDelegate(presenter)
        drawingToolView.setButtonsDelegate(presenter)
        chooseFormsView.setButtonsDelegate(presenter)
        canvasView.delegate = presenter
    }
}

extension DrawingViewController: DrawingView {
    func updateFrames(prevFrame: Canvas.Record?, currentFrame: Canvas.Record?) {
        canvasView.prevFrameRecord = prevFrame
        canvasView.currentRecord = currentFrame
    }

    func updateInstrument(type: InstrumentType) {
        canvasView.instrument = type
    }

    func formsViewIsHidden(_ isHidden: Bool) {
        chooseFormsView.isHidden = isHidden
    }

    func setInstrumentForChooseForm(_ type: InstrumentType) {
        chooseFormsView.setInstrument(type: type)
    }

    func selectInstrument(_ type: InstrumentType) {
        drawingToolView.selectInstrument(type)
    }
}
