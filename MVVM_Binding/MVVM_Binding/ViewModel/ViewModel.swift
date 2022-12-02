//
//  ViewModel.swift
//  MVVM_Binding
//
//  Created by Edgar Millan on 01/12/22.
//

import Foundation

class ViewModel {
    
    private let api = ApiUsers()
    var users: Observable<[UsersTableViewCellViewModel]> = Observable([])
    
    func getUsers() {
        api.requestusers { result in
            switch result {
            case .success(let results):
                self.users.value = self.parseResponse(response: results)
            case .failure(_):
                fatalError("Ocurrio un probema al recuperar los datos")
            }
        }
    }
    
    private func parseResponse(response: Welcome) -> [UsersTableViewCellViewModel] {
        return response.compactMap({
            UsersTableViewCellViewModel(id:$0.id, name:$0.name, username:$0.username, email:$0.email, phone:$0.phone, website:$0.website)
        })
    }
}
