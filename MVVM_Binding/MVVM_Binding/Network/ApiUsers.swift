//
//  ApiUsers.swift
//  MVVM_Binding
//
//  Created by Edgar Millán on 01/12/22.
//

import Foundation

struct ApiUsers {
    private let url = "https://jsonplaceholder.typicode.com/users"
    private let session = URLSession.init(configuration: .default)
    
    func requestusers(completion: @escaping (Result<Welcome,Error>) -> Void) {
        guard let url = URL(string: url) else {return}
        session.dataTask(with: url) { data, _, error in
            if let error = error {
                completion(.failure(error))
                return
            }
            guard let data = data else {return}
            do {
                let response = try JSONDecoder().decode(Welcome.self, from: data)
                completion(.success(response))
            } catch let error as NSError {
                fatalError(error.localizedDescription)
            }
        }.resume()
    }
}
