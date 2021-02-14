//
//  Helper.swift
//  RealmTodoAPP
//
//  Created by 井関竜太郎 on 2021/02/08.
//

import Foundation
import RealmSwift
import UserNotifications
import NotificationCenter

class Helper{
    
    let realm = try! Realm()
    
    func save(title:String,mode:String,linkk:String,date:Date,notification:Bool) {
        let item = TodoItem()
        item.title = title
        item.date = date
        item.mode = mode
        item.linkk = linkk
        item.notification = notification
        item.id = String(Int.random(in: 0...9999))
        try! realm.write{
            realm.add(item)
        }
        if item.notification == true {
            setNotification(item: item)
        }else{
        }
    }
    
 //   func update(title:String,mode:String,linkk:String,date:Date,notification:Bool,id:NSNumber) {
    func update(title:String,mode:String,linkk:String,date:Date,notification:Bool,id:String) {
        // let update = realm.objects(TodoItem.self).filter("id")
        
        let item = TodoItem()
        item.title = title
        item.date = date
        item.mode = mode
        item.linkk = linkk
        item.notification = notification
        item.id = String(Int.random(in: 0...9999))
 
        
        
      //  let target = realm.objects(TodoItem.self).filter("id")
        try! realm.write{
            //realm.autorefresh
               realm.add(item, update: .modified)
           // realm.create(TodoItem.self, value: ["title":title,"date":date,"mode":mode,"linkk":linkk,"notification":notification])
        /*
            let results = realm.objects(TodoItem.self)
            results[0].title = title
            results[0].date = date
            results[0].mode = mode
            results[0].linkk = linkk
            results[0].notification = notification
             
 */
         //   realm.add(TodoItem() ,update: .modified)
           
  
        }
    }
    
    
    
    
    
    
    
    func deteToString(date:Date) ->String {
        let formatter = DateFormatter()
        //  formatter.dateFormat = "MM/dd HH:mm"
        formatter.dateFormat = DateFormatter.dateFormat(fromTemplate: "EEEE HH:mm", options: 0, locale: Locale.current)
        return formatter.string(from:date)
    }
    
    
    
    func setNotification(item:TodoItem){
        
        
        let content = UNMutableNotificationContent()
        content.title = item.title + "がもうすく始まります"
        content.body = "アプリを開いて確認してみよう！"
        content.sound = UNNotificationSound.default
        
        
        let targetDate = Calendar.current.dateComponents([.year, .month, .day, .hour, .minute],from: item.date)
        let trigger = UNCalendarNotificationTrigger(dateMatching: targetDate,repeats: true)
        let request = UNNotificationRequest.init(identifier: item.id, content: content, trigger: trigger)
        
        UNUserNotificationCenter.current().add(request, withCompletionHandler: nil)
    }
    
    
    
    
    func deleteItem(item:TodoItem,token:NotificationToken) {
        UNUserNotificationCenter.current().removePendingNotificationRequests(withIdentifiers: [item.id])
        try! realm.write(withoutNotifying: [token]) {
            realm.delete(item)
        }
    }
    
    
    
    
}
