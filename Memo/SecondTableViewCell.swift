//
//  SecondTableViewCell.swift
//  Memo
//
//  Created by 春名卓哉 on 2019/05/23.
//  Copyright © 2019 Memo. All rights reserved.
//

import Foundation
import UIKit
class SecondTableViewCell: UITableViewCell{
    
    //IBOutletで繋がないとインスタンス化されない
    @IBOutlet var memoLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        
        memoLabel.frame = CGRect(x: 16, y: 0, width: UIScreen.main.bounds.width, height: 50)
        memoLabel.textAlignment = .left
    }
}
