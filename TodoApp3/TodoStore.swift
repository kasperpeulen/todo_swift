//
//  TodoStore.swift
//  TodoApp3
//
//  Created by Kasper Peulen on 11/16/15.
//  Copyright © 2015 Kasper Peulen. All rights reserved.
//

import Foundation

class TodoStore {
    static var shared = TodoStore()
    
    var todos: [Todo] = [Todo(title: "code"), Todo(title: "eat"), Todo(title: "sleep")]
    
    
    init() {
        if (store.arrayForKey("todos") != nil) {
            let json = store.arrayForKey("todos")
            todos = (json?.map(fromJson))!
            print(json);
        }
    }
    
    func saveTodos() {
        let json = todos.map({(todo: Todo) -> NSDictionary in todo.toJson()})
        store.setObject(json, forKey: "todos")
    }
    
    func fromJson(dic: AnyObject) -> Todo {
        let todo = Todo(title: dic["title"] as! String)
        todo.completed = dic["completed"] as! Bool
        return todo
    }
    
    func delete(todoTitle: String) {
        let index = todos.indexOf({(todo: Todo) -> Bool in todo.title == todoTitle})
        todos.removeAtIndex(index!)
    }
}

class Todo {
    var completed: Bool = false
    var title: String
    
    init(title: String) {
        self.title = title
    }
    
    func toJson() -> NSDictionary {
        return NSDictionary(dictionary: ["completed" : completed, "title": title])
    }
}

/// the todos saved as array of Todo objects
private let store = NSUserDefaults.standardUserDefaults()
