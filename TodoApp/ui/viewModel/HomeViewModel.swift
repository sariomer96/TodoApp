//
//  HomeViewModel.swift
//  TodoApp
//
//  Created by Omer on 2.10.2023.
//

import Foundation
import RxSwift

class HomeViewModel {
    
    var toDorepo = ToDoDaoRepository()
    var todoList = BehaviorSubject<[ToDo]>(value: [ToDo]())
    
    init(){
        toDorepo.dbCopy()
        todoList = toDorepo.toDoList
    }
    func ara(searchWord:String) {
  
        toDorepo.search(searchWord: searchWord)
    }

    func delete(id:Int){

        toDorepo.delete(id: id)
        loadToDo()
    }
    
    func loadToDo(){
        toDorepo.loadToDo()
    }
}
