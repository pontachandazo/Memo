//
//  SecondRegisterViewController.swift
//  Memo
//
//  Created by 春名卓哉 on 2019/05/23.
//  Copyright © 2019 Memo. All rights reserved.
//

import Foundation
import UIKit
class SecondRegisterViewController: UIViewController, UITextFieldDelegate{
    
    //UI
    private var button: UIButton = UIButton()
    let textField = UITextField()
    
    //グローバル変数(:どこからでもアクセスできる変数)
    var appDelegate:AppDelegate = UIApplication.shared.delegate as! AppDelegate
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //TextField
        textField.frame = CGRect(x: 0, y: 0, width:UIScreen.main.bounds.width , height: (UIScreen.main.bounds.height)-100)
        textField.placeholder = "ここにメモを入力してください"
        textField.delegate = self
        
        //Button
        button.frame = CGRect(x: 30, y: textField.frame.maxY + 8, width:(UIScreen.main.bounds.width)-60 , height: 50)
        button.setTitle("登録する", for: .normal)
        button.backgroundColor = UIColor.black
        button.tintColor = UIColor.white
        button.addTarget(self, action: #selector(register(sender:)), for: .touchUpInside)
        self.view.addSubview(textField)
        self.view.addSubview(button)
    }
    
    //キーボードのリターンボタンが押された時
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        //キーボード閉じる
        textField.resignFirstResponder()
        return true
    }
    
    //登録ボタンが押された時
    @objc func register(sender: UIButton){
      
        //TextFieldに入力があるかどうかチェック
        guard let memo = self.textField.text else {
            self.dismiss(animated: true, completion: nil)
            return
        }
        
        //空入力かどうかチェック
        if memo.elementsEqual(""){
            print("入力がからです")
            self.dismiss(animated: true, completion: nil)
            return
        }
        
        //グローバル変数のmemoArrayに保存
        appDelegate.memoArray.append(self.textField.text!)
        print(appDelegate.memoArray)
        
        //現在の画面を消す
        self.dismiss(animated: true, completion: nil)
        return
    }
}
