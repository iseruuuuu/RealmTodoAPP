//
//  ListViewController.swift
//  RealmTodoAPP
//
//  Created by 井関竜太郎 on 2021/02/09.
//

import UIKit

class ListViewController: UIViewController {
    
    @IBOutlet weak var text1: UILabel!
    @IBOutlet weak var text2: UILabel!
    @IBOutlet weak var text3: UILabel!
    @IBOutlet weak var link: UIButton!
    @IBOutlet weak var notText: UILabel!
    
    var string1 = String()
    var string2 = String()
    var linkk = String()
    var date3 = Date()
    var not = Bool()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        text1.text = string1
        text2.text = string2
        text3.text = "Every " + Helper().deteToString(date: date3)
        
        if not == false {
            notText.text = "オフ"
        }
        notText.text = "オン"
        
        
    }
    
    @IBAction func linkAction(_ sender: Any) {
        if UIApplication.shared.canOpenURL(URL(string: "\(linkk)")!) {
            UIApplication.shared.open(URL(string: linkk)!)
        }else{
            let dialog = UIAlertController(title: "URLが開けません。", message: "再設定OR登録してください", preferredStyle: .alert)
            dialog.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            self.present(dialog, animated: true, completion: nil)
        }
        
        
    }
    
    
    
    
}
