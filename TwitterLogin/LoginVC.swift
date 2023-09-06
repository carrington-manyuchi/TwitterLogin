//
//  ViewController.swift
//  TwitterLogin
//
//  Created by DA MAC M1 157 on 2023/09/04.
//

import UIKit

class LoginVC: UIViewController {
        
    private let scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()
    
    private let headerLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "See what's \nhappening in the \nworld right now."
        label.textColor = .label
        label.font = UIFont(name: "avenir", size: 33)
        label.numberOfLines = 3
        label.textAlignment = .left
        return label
    }()
    
    private let userTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.placeholder = "Username"
        textField.clearButtonMode = .always
        textField.layer.backgroundColor = UIColor.lightText.cgColor
        textField.layer.cornerRadius = CGFloat(25.0)
        textField.leftViewMode = .always
        textField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 20, height: 0))
        return textField
    }()
    
    private let pswdTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.placeholder = "Enter password"
        textField.clearButtonMode = .always
        textField.layer.backgroundColor = UIColor.lightText.cgColor
        textField.layer.cornerRadius = CGFloat(25.0)
        textField.leftViewMode = .always
        textField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 20, height: 0))
        textField.isSecureTextEntry = true
        
        return textField
    }()
    
    private let loginButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Login", for: .normal)
        button.layer.cornerRadius = CGFloat(25.0)
        return button
    }()
    
    private let extraTextLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "If you do not have an account, \nClick here to register."
        label.font = UIFont(name: "avenir", size: 13)
        label.font = UIFont.systemFont(ofSize: 13, weight: .semibold)
        label.numberOfLines = 2
        label.textAlignment = .left
        return label
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColorFromRGB(rgbValue: 0x91C8E4)
        loginButton.backgroundColor = UIColorFromRGB(rgbValue: 0x1DA1F2)
        extraTextLabel.textColor = UIColorFromRGB(rgbValue: 0x14171A)
        setupUI()
        loginButton.addTarget(self, action: #selector(loginTapped), for: .touchUpInside)
        //loginButton.addTarget(<#T##target: Any?##Any?#>, action: <#T##Selector#>, for: <#T##UIControl.Event#>)
    }
    
    
    @objc func loginTapped() {
        guard let user = userTextField.text, userTextField.text?.count != 0 else {
            userTextField.attributedPlaceholder = NSAttributedString(string: "Please enter email",
                                                                     attributes: [NSAttributedString.Key.foregroundColor: UIColor.red,
                                                                                  NSAttributedString.Key.font: UIFont(name: "Avenir", size: 18)!]
            )
            return
        }
        
        
        guard let password = pswdTextField.text, pswdTextField.text?.count != 0 else {
            pswdTextField.attributedPlaceholder = NSAttributedString(string: "Please enter password",
                                                                     attributes: [NSAttributedString.Key.foregroundColor: UIColor.red,
                                                                                  NSAttributedString.Key.font: UIFont(name: "Avenir", size: 18)!]
            )
            return
        }
        
        print(user)
        print(password)
    }
    
    
    func UIColorFromRGB(rgbValue: UInt) -> UIColor {
        return UIColor(
            red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
            alpha: CGFloat(1.0)
        )
    }

    
    func setupUI() {
        view.addSubview(scrollView)
        scrollView.addSubview(headerLabel)
        scrollView.addSubview(userTextField)
        scrollView.addSubview(pswdTextField)
        scrollView.addSubview(loginButton)
        scrollView.addSubview(extraTextLabel)
        setupConstraints()
    }
    
    func setupConstraints() {
       let scrollViewConstraints = [
        scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
        scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
        scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
        scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        scrollView.widthAnchor.constraint(equalTo: view.widthAnchor )
       // scrollView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 2)
       ]
        
        let hConst = scrollView.heightAnchor.constraint(equalTo: view.heightAnchor)
        hConst.isActive = true
        hConst.priority = UILayoutPriority(50)
        
        let headerLabelConstraints = [
            headerLabel.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 50),
            headerLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 30),
            headerLabel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -30),
        ]
        
        let userTextFieldConstraints = [
            userTextField.topAnchor.constraint(equalTo: headerLabel.bottomAnchor, constant: 35),
            userTextField.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 30),
            userTextField.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -30),
            userTextField.heightAnchor.constraint(equalToConstant: 50),
        ]
        
        let pswdTextFieldConstraints = [
            pswdTextField.topAnchor.constraint(equalTo: userTextField.bottomAnchor, constant: 35),
            pswdTextField.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 30),
            pswdTextField.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -30),
            pswdTextField.heightAnchor.constraint(equalToConstant: 50),
        ]
        
        
        let loginButtonConstraints = [
            loginButton.topAnchor.constraint(equalTo: pswdTextField.bottomAnchor, constant: 35),
            loginButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 30),
            loginButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -30),
            loginButton.heightAnchor.constraint(equalToConstant: 55)
        ]
        
        let extraTextLabelConstraints = [
            extraTextLabel.topAnchor.constraint(equalTo: loginButton.bottomAnchor, constant: 5),
            extraTextLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 52),
            extraTextLabel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -30),
            extraTextLabel.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor, constant: -50)
        ]
        
        
        NSLayoutConstraint.activate(scrollViewConstraints)
        NSLayoutConstraint.activate(headerLabelConstraints)
        NSLayoutConstraint.activate(userTextFieldConstraints)
        NSLayoutConstraint.activate(pswdTextFieldConstraints)
        NSLayoutConstraint.activate(loginButtonConstraints)
        NSLayoutConstraint.activate(extraTextLabelConstraints)
    }
    
    

}

