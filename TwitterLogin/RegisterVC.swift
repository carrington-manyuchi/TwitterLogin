//
//  RegisterVC.swift
//  TwitterLogin
//
//  Created by DA MAC M1 157 on 2023/09/05.
//

import UIKit

class RegisterVC: UIViewController {
    
    private let scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()
    
    private let registerLayer: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let fname: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.placeholder = "Enter first name"
        textField.layer.cornerRadius = CGFloat(25.0)
        textField.layer.backgroundColor = UIColor.white.cgColor
        
        textField.leftViewMode = .always
        textField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 25, height: 0))
        return textField
    }()

    private let lName: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.placeholder = "Enter last name"
        textField.layer.cornerRadius = CGFloat(25.0)
        textField.layer.backgroundColor = UIColor.white.cgColor
        textField.leftViewMode = .always
        textField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 25, height: 0))
        return textField
    }()
    
    private let cellField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.placeholder = "Enter your cell number"
        textField.keyboardType = UIKeyboardType.namePhonePad
        textField.layer.cornerRadius = CGFloat(25.0)
        textField.layer.backgroundColor = UIColor.white.cgColor
        textField.leftViewMode = .always
        textField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 25, height: 0))
        return textField
    }()
    
    private let emailField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.placeholder = "Enter email address"
        textField.keyboardType = UIKeyboardType.emailAddress
        textField.layer.cornerRadius = CGFloat(25.0)
        textField.layer.backgroundColor = UIColor.white.cgColor
        textField.leftViewMode = .always
        textField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 25, height: 0))
        return textField
    }()
    
    private let ageField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.placeholder = "Enter your age"
        textField.layer.cornerRadius = CGFloat(25.0)
        textField.layer.backgroundColor = UIColor.white.cgColor
        textField.leftViewMode = .always
        textField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 25, height: 0))
        return textField
    }()
    
    private let password: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.placeholder = "Enter password"
        textField.layer.backgroundColor = UIColor.white.cgColor
        textField.layer.cornerRadius = CGFloat(25.0)
    
        textField.leftViewMode = .always
        textField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 25, height: 0))
        
        return textField
        
    }()
    
    private let confirmPassword: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.placeholder = "Confirm password"
        textField.layer.backgroundColor = UIColor.white.cgColor
        textField.layer.cornerRadius = CGFloat(25.0)
        
        textField.leftViewMode = .always
        textField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 25, height: 0))
        return textField
        
    }()
    
    private let btnRegister: UIButton = {
        let button  = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Register", for: .normal)
        button.layer.cornerRadius = CGFloat(25.0)
        button.backgroundColor  = .blue
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
       // extraTextLabel.textColor = UIColorFromRGB(rgbValue: 0x14171A)
        setupUI()
    }
    
    
    
    
    private func setupUI() {
        view.backgroundColor = .systemBackground
        view.backgroundColor = UIColorFromRGB(rgbValue: 0x91C8E4)
        btnRegister.backgroundColor = UIColorFromRGB(rgbValue: 0x1DA1F2)
        setupSubViews()
    }
    
    func UIColorFromRGB(rgbValue: UInt) -> UIColor {
        return UIColor(
            red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
            alpha: CGFloat(1.0)
        )
    }
    
    private func setupSubViews() {
        view.addSubview(scrollView)
        scrollView.addSubview(registerLayer)
        scrollView.addSubview(fname)
        scrollView.addSubview(lName)
        scrollView.addSubview(cellField)
        scrollView.addSubview(emailField)
        scrollView.addSubview(ageField)
        scrollView.addSubview(password)
        scrollView.addSubview(confirmPassword)
        scrollView.addSubview(btnRegister)
        setupConstraints()
    }
    
    private func setupConstraints() {
        
        let scrollViewConstraints = [
            scrollView.topAnchor.constraint(equalTo: view.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ]
        
        let registerLayerConstraints = [
            registerLayer.topAnchor.constraint(equalTo: scrollView.topAnchor),
            registerLayer.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            registerLayer.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            registerLayer.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            registerLayer.widthAnchor.constraint(equalTo: scrollView.widthAnchor )
        ]
        
        let hConst = registerLayer.heightAnchor.constraint(equalTo: scrollView.heightAnchor)
        hConst.isActive = true
        hConst.priority = UILayoutPriority(50)
        
        let fnameConstraints = [
            fname.topAnchor.constraint(equalTo: registerLayer.safeAreaLayoutGuide.topAnchor, constant: 25),
            fname.leadingAnchor.constraint(equalTo: registerLayer.safeAreaLayoutGuide.leadingAnchor, constant: 30),
            fname.trailingAnchor.constraint(equalTo: registerLayer.safeAreaLayoutGuide.trailingAnchor, constant: -30),
            fname.heightAnchor.constraint(equalToConstant: 50)
        ]
        
        let lNameConstraints = [
            lName.topAnchor.constraint(equalTo: fname.bottomAnchor, constant: 30),
            lName.leadingAnchor.constraint(equalTo: registerLayer.safeAreaLayoutGuide.leadingAnchor, constant: 30),
            lName.trailingAnchor.constraint(equalTo: registerLayer.safeAreaLayoutGuide.trailingAnchor, constant: -30),
            lName.heightAnchor.constraint(equalToConstant: 50)
        ]
        
        let cellFieldConstraints = [
            cellField.topAnchor.constraint(equalTo: lName.bottomAnchor, constant: 30),
            cellField.leadingAnchor.constraint(equalTo: registerLayer.safeAreaLayoutGuide.leadingAnchor, constant: 30),
            cellField.trailingAnchor.constraint(equalTo: registerLayer.safeAreaLayoutGuide.trailingAnchor, constant: -30),
            cellField.heightAnchor.constraint(equalToConstant: 50)
        ]
        
        let emailFieldConstraints = [
            emailField.topAnchor.constraint(equalTo: cellField.bottomAnchor, constant: 30),
            emailField.leadingAnchor.constraint(equalTo: registerLayer.safeAreaLayoutGuide.leadingAnchor, constant: 30),
            emailField.trailingAnchor.constraint(equalTo: registerLayer.safeAreaLayoutGuide.trailingAnchor, constant: -30),
            emailField.heightAnchor.constraint(equalToConstant: 50)
        ]
        
        let ageFieldConstraints = [
            ageField.topAnchor.constraint(equalTo: emailField.bottomAnchor, constant: 30),
            ageField.leadingAnchor.constraint(equalTo: registerLayer.safeAreaLayoutGuide.leadingAnchor, constant: 30),
            ageField.widthAnchor.constraint(equalToConstant: 200),
            ageField.heightAnchor.constraint(equalToConstant: 50)
        ]
        
        
        let passwordConstraints = [
            password.topAnchor.constraint(equalTo: ageField.bottomAnchor, constant: 30),
            password.leadingAnchor.constraint(equalTo: registerLayer.safeAreaLayoutGuide.leadingAnchor, constant: 30),
            password.trailingAnchor.constraint(equalTo: registerLayer.safeAreaLayoutGuide.trailingAnchor, constant: -30),
            password.heightAnchor.constraint(equalToConstant: 50)
        ]
        
        let confirmPasswordConstraints = [
            confirmPassword.topAnchor.constraint(equalTo: password.bottomAnchor, constant: 30),
            confirmPassword.leadingAnchor.constraint(equalTo: registerLayer.safeAreaLayoutGuide.leadingAnchor, constant: 30),
            confirmPassword.trailingAnchor.constraint(equalTo: registerLayer.safeAreaLayoutGuide.trailingAnchor, constant: -30),
            confirmPassword.heightAnchor.constraint(equalToConstant: 50),
        ]
        
        let btnRegisterConstraints = [
            btnRegister.topAnchor.constraint(equalTo: confirmPassword.bottomAnchor, constant: 30),
            btnRegister.leadingAnchor.constraint(equalTo: registerLayer.safeAreaLayoutGuide.leadingAnchor, constant: 30),
            btnRegister.trailingAnchor.constraint(equalTo: registerLayer.safeAreaLayoutGuide.trailingAnchor, constant: -30),
            btnRegister.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor, constant: -50),
            btnRegister.heightAnchor.constraint(equalToConstant: 50)
            
        ]
        
        NSLayoutConstraint.activate(scrollViewConstraints)
        NSLayoutConstraint.activate(registerLayerConstraints)
        NSLayoutConstraint.activate(fnameConstraints)
        NSLayoutConstraint.activate(lNameConstraints)
        NSLayoutConstraint.activate(cellFieldConstraints)
        NSLayoutConstraint.activate(emailFieldConstraints)
        NSLayoutConstraint.activate(ageFieldConstraints)
        NSLayoutConstraint.activate(passwordConstraints)
        NSLayoutConstraint.activate(confirmPasswordConstraints)
        NSLayoutConstraint.activate(btnRegisterConstraints)
    }

    
}
