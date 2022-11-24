//
//  main.swift
//  MyCreditManager
//
//  Created by 김영인 on 2022/11/23.
//

import Foundation

let myCreditManager = MyCreditManager()
var isExit = false

while !isExit {
    print(Const.Input.msg)
    
    let input = readLine()!
    
    switch input {
    case "1":
        myCreditManager.addStudent()
    case "2":
        myCreditManager.deleteStudent()
    case "3":
        myCreditManager.addGrade()
    case "4":
        myCreditManager.deleteGrade()
    case "5":
        myCreditManager.showGrade()
    case "X":
        myCreditManager.exit()
        isExit = true
    default:
        print(Const.Input.errorMsg)
    }
}
