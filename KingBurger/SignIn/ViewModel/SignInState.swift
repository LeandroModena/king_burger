//
//  SignInState.swift
//  KingBurger
//
//  Created by Leandro Modena on 30/05/24.
//

import Foundation

enum SignInState {
    case none
    case loading
    case goToHome
    case error(String)
}
