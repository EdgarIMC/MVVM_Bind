//
//  Model.swift
//  MVVM_Binding
//
//  Created by Edgar Millán on 01/12/22.
//

import Foundation

// MARK: - WelcomeElement
struct WelcomeElement: Codable {
    let id: Int
    let name, username, email: String
    let address: Address
    let phone, website: String
    let company: Company
}

// MARK: - Address
struct Address: Codable {
    let street, suite, city, zipcode: String
    let geo: Geo
}

// MARK: - Geo
struct Geo: Codable {
    let lat, lng: String
}

// MARK: - Company
struct Company: Codable {
    let name, catchPhrase, bs: String
}

typealias Welcome = [WelcomeElement]

struct UsersTableViewCellViewModel {
    let id: Int
    let name, username, email: String
    let phone, website: String
}
