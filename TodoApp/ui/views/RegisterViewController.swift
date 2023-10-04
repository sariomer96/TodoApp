//
//  RegisterViewController.swift
//  TodoApp
//
//  Created by Omer on 2.10.2023.
//

import UIKit

class RegisterViewController: UIViewController {

    @IBOutlet weak var tfTodoText: UITextField!
    var viewModel = RegisterViewModel()
    override func viewDidLoad() {
        print("viee")
        super.viewDidLoad()
 
    }
    

    @IBAction func saveClicked(_ sender: Any) {
        print("clicfffffjed")
        if let name = tfTodoText.text {
            viewModel.save(name: name)
            print("clicjed")
        }
    }
    
  
    
}
