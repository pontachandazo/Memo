//
//  SecondTableViewController.swift
//  Memo
//
//  Created by 春名卓哉 on 2019/05/23.
//  Copyright © 2019 Memo. All rights reserved.
//

import Foundation
import UIKit
class SecondTableViewController: UIViewController, UITableViewDataSource,UITableViewDelegate {
    
    //appdelegateはどこからでもアクセスできる
    var appDelegate:AppDelegate = UIApplication.shared.delegate as! AppDelegate
    
    //tableViewはインスタンス化する
    @IBOutlet var tableView: UITableView!
    
    //最初にファイルが読み込まれる時だけ呼ばれる
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //navigationBar
        self.navigationItem.title = "メモ一覧"
        // 戻るボタンを設置
        var backButton: UIBarButtonItem = UIBarButtonItem(barButtonSystemItem: .cancel, target: self, action: #selector(onClickBackButton(_:)))
        self.navigationItem.leftBarButtonItem = backButton
        
        //投稿ボタンを設置
        let addButton: UIBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(onClickAddButton(_:)))
        self.navigationItem.rightBarButtonItem = addButton
        
        //tableView
        tableView.delegate = self
        tableView.dataSource = self
        tableView.frame = CGRect(x: 0, y: self.navigationController?.navigationBar.frame.maxY ?? 55, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height - 55)
    }
    
    //ファイルが読み込まれると毎回読まれる
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        //tableViewの更新作業
        self.tableView.reloadData()
    }
    
    //メモの数
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.appDelegate.memoArray.count
    }
    
    //cell作成
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        //as! SecondTableViewCellがないとcellを認識しない
        let cell = tableView.dequeueReusableCell(withIdentifier: "SecondTableViewCell", for: indexPath) as! SecondTableViewCell
        
        print("ここで中身拝見")
        print(cell)
        print(self.appDelegate.memoArray[indexPath.row])
        print(indexPath.row)
        
        cell.memoLabel.textColor = UIColor.black
        
    //let memoArray: [String] = ["メモ１", "メモ２","メモ３"]
        cell.memoLabel.text = self.appDelegate.memoArray[indexPath.row]
        
        return cell
    }
    
    @objc func onClickBackButton(_ sender: UIBarButtonItem) {
        self.dismiss(animated: true, completion: nil)
    }
    @objc func onClickAddButton(_ sender: UIBarButtonItem) {
        let storyboard: UIStoryboard = self.storyboard!
        let SecondRegisterViewController = storyboard.instantiateViewController(withIdentifier: "SecondRegisterViewController")
        self.present(SecondRegisterViewController, animated: true, completion: nil)
    }
}
