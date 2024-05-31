//
//  SignInViewModel.swift
//  KingBurger
//
//  Created by Leandro Modena on 30/05/24.
//

import Foundation

protocol SignInViewModelDelegate {
    func viewModelDidChange(viewModel: SignInViewModel)
}

class SignInViewModel {
    
    var delegate: SignInViewModelDelegate?
    
    var state: SignInState = .none {
        didSet {
            delegate?.viewModelDidChange(viewModel: self)
        }
    }
        
    
    func send() {
        state = .loading
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            self.state = .error("Usuário não existe")
            
        }
    }
    
}
