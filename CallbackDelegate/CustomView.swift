import UIKit
import SnapKit

protocol CustomViewDelegate: AnyObject {
    func buttonTapped(withText text: String)
}

class CustomView: UIView {
    weak var delegate: CustomViewDelegate?

    private lazy var textField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Enter text"
        textField.borderStyle = .roundedRect
        return textField
    }()

    private lazy var button: UIButton = {
        let button = UIButton()
        button.setTitle("Send", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .blue
        button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        return button
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupUI() {
        addSubview(textField)
        addSubview(button)

        textField.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(20)
            make.leading.equalToSuperview().offset(20)
            make.trailing.equalTo(button.snp.leading).offset(-10)
        }

        button.snp.makeConstraints { make in
            make.centerY.equalTo(textField)
            make.trailing.equalToSuperview().offset(-20)
            make.width.equalTo(50)
            make.height.equalTo(30)
        }
    }

    @objc private func buttonTapped() {
        delegate?.buttonTapped(withText: textField.text ?? "")
    }
}
