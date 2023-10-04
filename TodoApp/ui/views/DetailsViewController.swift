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
 
    }
    

    @IBAction func updateClick(_ sender: Any) {
    }
    

}
