//
//  SignInViewController.swift
//  KingBurger
//
//  Created by Leandro Modena on 17/05/24.
//

import Foundation
import UIKit

class SignInViewController: UIViewController {
    
    var viewModel: SignInViewModel? {
        didSet {
            viewModel?.delegate = self
        }
    }
    
    let email: UITextField = {
        let prp = UITextField()
        prp.backgroundColor = UIColor.white
        prp.placeholder = "Entre com seu e-mail"
        prp.translatesAutoresizingMaskIntoConstraints = false
        return prp
    }()
    
    let password: UITextField = {
        let prp = UITextField()
        prp.backgroundColor = .red
        prp.placeholder = "Entre com sua senha"
        prp.translatesAutoresizingMaskIntoConstraints = false
        return prp
    }()
    
    lazy var send: UIButton = {
        let prp = UIButton()
        prp.setTitle("Entrar", for: .normal)
        prp.setTitleColor(.black, for: .normal)
        prp.backgroundColor = .yellow
        prp.translatesAutoresizingMaskIntoConstraints = false
        prp.addTarget(self, action: #selector(sendDidTap), for: .touchUpInside)
        return prp
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .green
        view.addSubview(email)
        view.addSubview(password)
        view.addSubview(send)
        
        let emailConstraints = [
            // Esquerda
            email.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            // Direita
            email.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            // Centro
            email.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -100.0),
            // Tamanho
            email.heightAnchor.constraint(equalToConstant: 50.0)
        ]
        
        let passwordConstraints = [
            password.leadingAnchor.constraint(equalTo: email.leadingAnchor),
            password.trailingAnchor.constraint(equalTo: email.trailingAnchor),
            password.topAnchor.constraint(equalTo: email.bottomAnchor, constant: 8.0),
            password.heightAnchor.constraint(equalToConstant: 50.0)
        ]
        
        let sendConstraints = [
            send.leadingAnchor.constraint(equalTo: password.leadingAnchor),
            send.trailingAnchor.constraint(equalTo: password.trailingAnchor),
            send.topAnchor.constraint(equalTo: password.bottomAnchor, constant: 16),
            send.heightAnchor.constraint(equalToConstant: 60.0)
        ]
        
        NSLayoutConstraint.activate(emailConstraints)
        NSLayoutConstraint.activate(passwordConstraints)
        NSLayoutConstraint.activate(sendConstraints)
    }
    
    @objc func sendDidTap(_ sender: UIButton) {
        viewModel?.send()
    }
    
}

extension SignInViewController: SignInViewModelDelegate{
    func viewModelDidChange(viewModel: SignInViewModel) {
        print("OnChange state ->  \(viewModel.state)")
    }
}
