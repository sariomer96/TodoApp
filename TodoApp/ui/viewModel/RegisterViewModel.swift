//
//  RegisterViewModel.swift
//  TodoApp
//
//  Created by Omer on 2.10.2023.
//

import Foundation

class RegisterViewModel {
    
    
    var repo = ToDoDaoRepository()
    func kaydet(name:String){

        repo.save(name: name)
   
    }
}
