//
//  String+Ext.swift
//  MyCreditManager
//
//  Created by 김영인 on 2022/11/24.
//

import Foundation

extension String {
    func checkValid() -> Bool {
        let regex = "^[0-9a-zA-Z\\s,+]*$"
        
        let pred = NSPredicate(format: "SELF MATCHES %@", regex)
        return pred.evaluate(with: self)
    }
}
