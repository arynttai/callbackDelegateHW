import UIKit
import SnapKit

class ViewController: UIViewController {
    private lazy var labelForDelegate: UILabel = {
        let label = UILabel()
        label.text = ""
        label.textAlignment = .center
        return label
    }()

    private lazy var labelForCallback: UILabel = {
        let label = UILabel()
        label.text = ""
        label.textAlignment = .center
        return label
    }()

    private lazy var customView: CustomView = {
        let view = CustomView()
        view.delegate = self
        return view
    }()

    private lazy var customViewWithCallback: CustomViewWithCallback = {
        let view = CustomViewWithCallback()
        view.buttonCallback = { [weak self] text in
            self?.labelForCallback.text = text
        }
        return view
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }

    private func setupUI() {
        view.backgroundColor = .white
        view.addSubview(labelForDelegate)
        view.addSubview(labelForCallback)
        view.addSubview(customView)
        view.addSubview(customViewWithCallback)

        labelForDelegate.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(20)
        }

        labelForCallback.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(labelForDelegate.snp.bottom).offset(20)
        }

        customView.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(labelForCallback.snp.bottom).offset(20)
            make.width.equalTo(200)
            make.height.equalTo(150)
        }

        customViewWithCallback.snp.makeConstraints { make in
            make.top.equalTo(customView.snp.bottom).offset(20)
            make.centerX.equalToSuperview()
            make.width.equalTo(200)
            make.height.equalTo(150)
        }
    }
}

extension ViewController: CustomViewDelegate {
    func buttonTapped(withText text: String) {
        labelForDelegate.text = text
    }
}
