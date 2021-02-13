//
//  TodoItem.swift
//  RealmTodoAPP
//
//  Created by 井関竜太郎 on 2021/02/08.
//

import Foundation
import RealmSwift


class TodoItem:Object {
    @objc dynamic var id = ""
    @objc dynamic var title = ""
    @objc dynamic var mode = ""
    @objc dynamic var linkk = ""
    @objc dynamic var date = Date()
    @objc dynamic var notification: Bool = false
    
    
}
