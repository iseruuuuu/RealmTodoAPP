//
//  AddViewController.swift
//  RealmTodoAPP
//
//  Created by 井関竜太郎 on 2021/02/08.
//

import UIKit
import RealmSwift

class AddViewController: UIViewController {
    
    @IBOutlet weak var itemField: UITextField!
    @IBOutlet weak var modeField: UITextField!
    @IBOutlet weak var datePicker: UIDatePicker!
    @IBOutlet weak var add: UIButton!
    @IBOutlet weak var linkField: UITextField!
    @IBOutlet weak var swichNotification: UISwitch!
    
    let realm = try! Realm()
    override func viewDidLoad() {
        super.viewDidLoad()
        datePicker.datePickerMode = UIDatePicker.Mode.dateAndTime
        datePicker.timeZone = NSTimeZone.local
        datePicker.locale = Locale.current
        add.layer.cornerRadius = 15
        add.layer.borderWidth = 2
        add.layer.borderColor = UIColor.systemTeal.cgColor
    }
    
    
    @IBAction func add(_ sender: Any) {
        
        let alert: UIAlertController = UIAlertController(title: "登録確認", message: "時間設定は授業開始の5~10分前をおすすめしています。", preferredStyle:  UIAlertController.Style.actionSheet)
        let defaultAction: UIAlertAction = UIAlertAction(title: "登録する", style: UIAlertAction.Style.default, handler:{ [self]
            (action: UIAlertAction!) -> Void in
            print("OK")
            Helper().save(title:itemField.text!,mode:modeField.text!,linkk:linkField.text!,date:datePicker.date,notification: swichNotification.isOn)
            //画面を閉じた時の演出は,completionを設定する。
            dismiss(animated: true, completion: nil)
            //self.navigationController?.popViewController(animated: true)
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

