//
//  AddTodoVC.swift
//  TodoApp3
//
//  Created by Kasper Peulen on 11/16/15.
//  Copyright © 2015 Kasper Peulen. All rights reserved.
//

import UIKit

class AddTodoVC: UIViewController {
    
    @IBOutlet weak var inputField: UITextField!
    
    var todoStore: TodoStore = TodoStore.shared
    
    @IBAction func addTodo(sender: AnyObject) {
        todoStore.todos.append(Todo(title: inputField.text!))
        let next = self.storyboard?.instantiateViewControllerWithIdentifier("TodosNavigator")
        self.presentViewController(next!, animated: true, completion: nil)
        todoStore.saveTodos()
    }
    
}
