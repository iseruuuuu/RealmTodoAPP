//
//  EditViewController.swift
//  RealmTodoAPP
//
//  Created by 井関竜太郎 on 2021/02/08.
//
/*
 
 2/10の課題
 
 editViewControllerでデータを更新できるようにする。 ->新しいものにする　→削除はやらせる。
 
 編集したものー＞　追加された。　ー＞元のデータが削除されない。
 
 */

import UIKit
import RealmSwift

class EditViewController: UIViewController {
    
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var textField2: UITextField!
    @IBOutlet weak var textField3: UITextField!
    @IBOutlet weak var dateText: UILabel!
    
    @IBOutlet weak var datePicker2: UIDatePicker!
    
    @IBOutlet weak var change: UISwitch!
    
    @IBOutlet weak var addd: UIButton!
    
    var editlabel1 = String()
    var editlabel2 = String()
    var editlabel3 = String()
    var editDate = Date()
    
    var id = String()
    
    let realm = try! Realm()
    var itemList:Results<TodoItem>!
    var token:NotificationToken!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        textField.text = editlabel1
        textField2.text = editlabel2
        textField3.text = editlabel3
        dateText.text = "Every " + Helper().deteToString(date: editDate)
        addd.layer.cornerRadius = 15
        addd.layer.borderWidth = 2
        addd.layer.borderColor = UIColor.systemTeal.cgColor
        addd.layer.cornerRadius = 15
        addd.layer.borderWidth = 2
        addd.layer.borderColor = UIColor.systemTeal.cgColor
        print(id)
    }
    
    
    @IBAction func setAgain(_ sender: Any) {
        let alert: UIAlertController = UIAlertController(title: "変更確認", message: "変更してよろしいですか？", preferredStyle:  UIAlertController.Style.actionSheet)
        let defaultAction: UIAlertAction = UIAlertAction(title: "変更する", style: UIAlertAction.Style.default, handler:{ [self]
            (action: UIAlertAction!) -> Void in
            print("OK")
            Helper().update(title:textField.text!,mode:textField2.text!,linkk:textField3.text!,date: datePicker2.date,notification: change.isOn,id:id)
            
            
            self.navigationController?.popViewController(animated: true)
        })
        let cancelAction: UIAlertAction = UIAlertAction(title: "キャンセル", style: UIAlertAction.Style.cancel, handler:{
            (action: UIAlertAction!) -> Void in
            print("Cancel")
        })
        alert.addAction(cancelAction)
        alert.addAction(defaultAction)
        present(alert, animated: true, completion: nil)
        
        
        
        
    }
}



