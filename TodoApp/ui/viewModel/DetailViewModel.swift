//
//  DetailViewModel.swift
//  TodoApp
//
//  Created by Omer on 2.10.2023.
//

import Foundation

class DetailViewModel {
    
    var toDorepo = ToDoDaoRepository()
    
    func guncelle(id:Int,name:String){
      
        toDorepo.update(id: id, name: name)
    }
}
