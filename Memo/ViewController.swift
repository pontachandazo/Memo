//  ViewController.swift
//  Memo
//  Created by 春名卓哉 on 2019/03/05.
//  Copyright © 2019年 Memo. All rights reserved.
import UIKit

class ViewController: UIViewController {

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //画面の縦横の幅を取得
        let screenHeight = UIScreen.main.bounds.height
        let screenWidth = UIScreen.main.bounds.width
    
        //CGRectを使い場所を決める
        let titleLabel = UILabel()
        let button = UIButton()
        
        titleLabel.frame = CGRect(x: 0, y: (screenHeight/2)-40, width: screenWidth,
                                  height: 80)
        button.frame = CGRect(x: (screenWidth/2)-100, y: titleLabel.frame.maxY + 16, width: 200, height: 50)
        
        //Label
        titleLabel.text = "メモ帳アプリ"
        titleLabel.textAlignment = .center
        titleLabel.textColor = UIColor.white
        titleLabel.font = UIFont.boldSystemFont(ofSize: 72)
        
        
        self.view.addSubview(titleLabel)
        
        //Button
        button.layer.cornerRadius = 20
        button.backgroundColor = UIColor.green
        button.tintColor = UIColor.white
        button.setTitle("一覧へ", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 36)
        button.addTarget(self, action: #selector(pushButton(sender:)), for: .touchUpInside)
        self.view.addSubview(button
        )
        
        
    //背景画像(参考URL：https://qiita.com/Camino/items/8536c8270789732a86fc)
        let backgroud = UIImageView()
        
        backgroud.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
        backgroud.image = UIImage(named: "backgroud")
        backgroud.layer.zPosition = -1
        
    
        self.view.addSubview(backgroud)
        
        
    
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(true)
    }
    
    @objc func pushButton(sender:UIButton){
        //デバック:処理やエラーのrチェックをすること
        print("ボタンが押されました")
        //NavigationController+SecondViewControllerに移動
        let storyboard: UIStoryboard = self.storyboard!
        let NavigationController = storyboard.instantiateViewController(withIdentifier: "nav")
        self.present(NavigationController, animated: true, completion: nil)
    }
    
    
   
    
    
    
    
    
    
    
    
    
    
    @objc func pushTestButton(seneder: UIButton){
        print("テストボタンが押されました")
        let storyboard: UIStoryboard = self.storyboard!
        let nextViewController = storyboard.instantiateViewController(withIdentifier: "TestTaTestTableViewController")
        self.present(nextViewController, animated: true, completion: nil)
        
    }
    
    @objc func pushTest2Button(seneder: UIButton){
        print("テストボタン2が押されました")
        let storyboard: UIStoryboard = self.storyboard!
        let nextViewController = storyboard.instantiateViewController(withIdentifier: "SecondTableViewController")
        self.present(nextViewController, animated: true, completion: nil)
        
    }
}

