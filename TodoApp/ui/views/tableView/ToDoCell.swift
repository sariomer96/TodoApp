//
//  ToDoCell.swift
//  TodoApp
//
//  Created by Omer on 2.10.2023.
//

import UIKit

class ToDoCell: UITableViewCell {

    @IBOutlet weak var labelTodoName: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
      
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
 
    }

}
