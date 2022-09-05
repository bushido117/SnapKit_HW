//
//  ViewController.swift
//  DependencyManager
//
//  Created by Вадим Сайко on 31.08.22.
//

import UIKit
import SnapKit

class ViewController: UIViewController, TopViewDelegate, BottomViewDelegate {
    
    var text: String = ""
    
    lazy var profileInfoView = ProfileInfoView()
    lazy var bottomButtonsView = BottomButtonsView()
    lazy var textView: UITextView = {
        let textView = UITextView()
        textView.text = "Enter your notes:"
        textView.textColor = UIColor.black
        textView.backgroundColor = .gray
        return textView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        profileInfoView.topViewDelegate = self
        bottomButtonsView.bottomViewDelegate = self
        self.navigationController?.navigationBar.isTranslucent = false
        self.title = "Profile"
        addSubviews()
        makeConstraints()
    }
    
    func addSubviews() {
        self.view.addSubview(profileInfoView)
        self.view.addSubview(bottomButtonsView)
        self.view.addSubview(textView)
    }
    
    func makeConstraints() {
        profileInfoView.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.leading.equalToSuperview().inset(10)
            make.trailing.equalToSuperview().offset(-10)
            make.height.equalTo(self.view.frame.height * 0.162)
        }
        bottomButtonsView.snp.makeConstraints { make in
            make.bottom.equalToSuperview()
            make.leading.equalToSuperview().offset(10)
            make.trailing.equalToSuperview().offset(-10)
            make.height.equalTo(self.view.frame.height * 0.08)
        }
        textView.snp.makeConstraints { make in
            make.bottom.equalTo(bottomButtonsView.snp.top)
            make.top.equalTo(profileInfoView.snp.bottom).offset(10)
            make.leading.equalToSuperview().offset(10)
            make.trailing.equalToSuperview().offset(-10)
        }
    }

    func textFieldResignFirstResponder(_ textField: UITextField) {
        self.text += " " + (textField.text ?? "")
    }
    
    func addTextToTextView(_ button: UIButton) {
        textView.text += self.text
        self.text = ""
    }
}

