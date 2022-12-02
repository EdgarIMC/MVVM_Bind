//
//  Observer.swift
//  MVVM_Binding
//
//  Created by Edgar Millán on 01/12/22.
//

import Foundation

class Observable<T> {
    
    typealias Bind = T
    var value: Bind? {
        didSet {
            listener?(value)
        }
    }
    private var listener: ((Bind?) -> Void)?
    init(_ value: Bind?) {
        self.value = value
    }
    func bind(_ listener: @escaping (Bind?) -> Void) {
        listener(value)
        self.listener = listener
    }
}
