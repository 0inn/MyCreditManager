//
//  InputType.swift
//  MyCreditManager
//
//  Created by 김영인 on 2022/11/24.
//

import Foundation

enum InputType {
    case addStudent
    case deleteStudent
    case addGrade
    case deleteGrade
    case showGrade
    
    var msg: String {
        switch self {
        case .addStudent:
            return Const.AddStudent.msg
        case .deleteStudent:
            return Const.DeleteStudent.msg
        case .addGrade:
            return Const.AddGrade.msg
        case .deleteGrade:
            return Const.DeleteGrade.msg
        case .showGrade:
            return Const.ShowGrade.msg
        }
    }
    
    var errorMsg: String {
        switch self {
        case .addStudent, .deleteStudent, .addGrade, .deleteGrade, .showGrade:
            return Const.Error.msg
        }
    }
}
