//
//  DetailsViewController.swift
//  TodoApp
//
//  Created by Omer on 2.10.2023.
//

import UIKit

class DetailsViewController: UIViewController {

   
    @IBOutlet weak var tfTodoName: UITextField!
    var todo:ToDo?
    var viewModel = DetailViewModel()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let todo = todo {
            tfTodoName.text = todo.name
        }
 
    }
    
    @IBAction func updateClicked(_ sender: Any) {
        if let name = tfTodoName.text , let to = todo {
            viewModel.update(id: to.id!, name: name)
        }
    }
  
    

}
