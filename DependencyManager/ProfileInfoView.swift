//
//  ProfileInfoView.swift
//  DependencyManager
//
//  Created by Вадим Сайко on 2.09.22.
//

import UIKit
import SnapKit

class ProfileInfoView: UIView, UITextFieldDelegate {
    
    var textEditingEnded: ((UITextField) -> Void)?
    
    lazy var mainTopStack: UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = NSLayoutConstraint.Axis.horizontal
        stack.alignment = UIStackView.Alignment.center
        return stack
    }()
    
    lazy var stackForLabels: UIStackView = {
        let stack = UIStackView()
        stack.axis = NSLayoutConstraint.Axis.vertical
        stack.distribution = UIStackView.Distribution.fillEqually
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    lazy var stackForTextFields: UIStackView = {
        let stack = UIStackView()
        stack.axis = NSLayoutConstraint.Axis.vertical
        stack.distribution = UIStackView.Distribution.fillEqually
        stack.spacing = 6
        return stack
    }()
    
    lazy var avatar: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "avatar"))
        return imageView
    }()

    lazy var firstLabel: UILabel = {
        let label = UILabel()
        label.text = "First"
        return label
    }()
    
    lazy var middleLabel: UILabel = {
        let label = UILabel()
        label.text = "Middle"
        return label
    }()
    
    lazy var lastLabel: UILabel = {
        let label = UILabel()
        label.text = "Last"
        return label
    }()
    
    lazy var firstTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Enter First Name"
        textField.borderStyle = .roundedRect
        return textField
    }()
    
    lazy var middleTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Enter Middle Name"
        textField.borderStyle = .roundedRect
        return textField
    }()
    
    lazy var lastTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Enter Last Name"
        textField.borderStyle = .roundedRect
        return textField
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubviews()
        
        firstTextField.delegate = self
        middleTextField.delegate = self
        lastTextField.delegate = self
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func updateConstraints() {
        mainTopStack.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        avatar.snp.makeConstraints { make in
            make.width.equalTo(mainTopStack.snp.height)
        }
        stackForLabels.snp.makeConstraints { make in
            make.width.equalTo((superview?.frame.width ?? 0) * 0.14)
            make.height.equalTo(mainTopStack.snp.height)
        }
        stackForTextFields.snp.makeConstraints { make in
            make.height.equalTo(mainTopStack.snp.height)
        }
        super.updateConstraints()
    }
    
    func addSubviews() {
        stackForLabels.addArrangedSubview(firstLabel)
        stackForLabels.addArrangedSubview(middleLabel)
        stackForLabels.addArrangedSubview(lastLabel)
        stackForTextFields.addArrangedSubview(firstTextField)
        stackForTextFields.addArrangedSubview(middleTextField)
        stackForTextFields.addArrangedSubview(lastTextField)
        mainTopStack.addArrangedSubview(avatar)
        mainTopStack.addArrangedSubview(stackForLabels)
        mainTopStack.addArrangedSubview(stackForTextFields)
        addSubview(mainTopStack)
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        textEditingEnded?(textField)
    }
}
