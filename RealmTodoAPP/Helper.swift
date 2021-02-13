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
