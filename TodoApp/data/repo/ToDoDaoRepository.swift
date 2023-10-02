//
//  ToDoDaoRepository.swift
//  TodoApp
//
//  Created by Omer on 2.10.2023.
//

import Foundation
import RxSwift

class ToDoDaoRepository {
    
    var toDoList = BehaviorSubject<[ToDo]>(value: [ToDo]())
    let db:FMDatabase?
    
    init() {
        let targetPath = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first!
        let dbUrl = URL(fileURLWithPath: targetPath).appendingPathComponent("Todoo.sqlite")
        db = FMDatabase(path: dbUrl.path)
        
        
    }
    
    func save(name:String){
        
        db?.open()
        
        do{
            try db?.executeUpdate("INSERT INTO AppToDo  (name) VALUES (?)", values: [name])
            
        }catch{
            print(error.localizedDescription)
        }
        
        db?.close()
        
    }
    func update(id:Int,name:String){
        db?.open()
        
        do{
            try db?.executeUpdate("UPDATE AppToDo SET name=? WHERE id=?  ", values: [name,id])
            
        }catch{
            print(error.localizedDescription)
        }
        
        db?.close()
        
    }
    
    func search(searchWord:String) {
        
        db?.open()
        var list = [ToDo]()
        do{
            let rs = try db!.executeQuery("SELECT * FROM AppToDo  WHERE name like '%\(searchWord)%'", values: nil)
            
            while rs.next() {
                let id = Int(rs.string(forColumn: "id"))!
                let name = rs.string(forColumn: "name")!
            
                
                let toDo = ToDo(id: id, name: name)
                list.append(toDo)
            }
            toDoList.onNext(list)
        }catch{
            print(error.localizedDescription)
        }
        db?.close()
    }
    
    func delete(id:Int){
        db?.open()
        
        do{
            try db?.executeUpdate("DELETE FROM AppToDo  WHERE id=?  ", values: [id])
            
        }catch{
            print(error.localizedDescription)
        }
        
        db?.close()
    }
    
    func loadToDo(){
    
        db?.open()
        var list = [ToDo]()
        do{
            let rs = try db!.executeQuery("SELECT * FROM AppToDo ", values: nil)
            
            while rs.next() {
                let id = Int(rs.string(forColumn: "id"))!
                let name = rs.string(forColumn: "name")!
            
               
                
                let todo = ToDo(id: id, name: name)
                list.append(todo)
            }
            toDoList.onNext(list)
        }catch{
            print(error.localizedDescription)
        }
        db?.close()
    }
    
    
    
    func dbCopy(){
            let bundlePath = Bundle.main.path(forResource: "Todoo", ofType: ".sqlite")
            let targetPath = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first!
            let copyPath = URL(fileURLWithPath: targetPath).appendingPathComponent("Todoo.sqlite")
            let fileManager = FileManager.default
            if fileManager.fileExists(atPath: copyPath.path){
                print("The database is already exist")
            }else{
                do{
                    try fileManager.copyItem(atPath: bundlePath!, toPath: copyPath.path)
                }catch{
                    print(error.localizedDescription)
                }
            }
        }
    
}
