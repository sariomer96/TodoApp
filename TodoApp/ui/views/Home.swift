//
//  ViewController.swift
//  TodoApp
//
//  Created by Omer on 2.10.2023.
//
import RxSwift
import UIKit

class Home: UIViewController {

    @IBOutlet weak var todoTableView: UITableView!
    @IBOutlet weak var searchBar: UISearchBar!
   
    var viewModel = HomeViewModel()
    var todoList = [ToDo]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        searchBar.delegate = self
        todoTableView.delegate = self
        todoTableView.dataSource = self
        
        _ = viewModel.todoList.subscribe(onNext: { list in
            self.todoList = list
            self.todoTableView.reloadData()
        })
        // Do any additional setup after loading the view.
    }

    override func viewWillAppear(_ animated: Bool) {
        print("anasayfaya donuldu")
        viewModel.loadToDo()
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toDetail" {
            
            if let todo = sender as? ToDo {
                let targetVC = segue.destination as! DetailsViewController
                targetVC.todo = todo
                
            }
        }
    }
    
  
}

extension Home : UISearchBarDelegate {
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
       
        viewModel.search(searchWord: searchText)
    }
    
   
}



extension Home : UITableViewDelegate , UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return todoList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ToDoCell") as! ToDoCell
        
        let todo = todoList[indexPath.row]
        
        cell.labelTodoName.text = todo.name
       
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let todo = todoList[indexPath.row]
        
        performSegue(withIdentifier: "toDetail", sender: todo)
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let deleteAction = UIContextualAction(style: .destructive, title: "Delete"){
            contextualAction,view,bool in
            
            let todo = self.todoList[indexPath.row]
            let alert = UIAlertController(title: "Delete", message: "\(todo.name!) Are you sure you want to delete?", preferredStyle: .alert)
            
            let cancel = UIAlertAction(title: "Cancel", style: .cancel)
            let yes = UIAlertAction(title: "Delete", style: .destructive) {
                action in
                self.viewModel.delete(id: todo.id!)
                
            }
            
            alert.addAction(cancel)
            alert.addAction(yes)
            self.present(alert,animated: true)
            
            
        }
        
        return UISwipeActionsConfiguration(actions: [deleteAction])
    }
    
}
