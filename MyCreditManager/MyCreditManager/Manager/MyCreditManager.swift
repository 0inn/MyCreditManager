//
//  MyCreditManager.swift
//  MyCreditManager
//
//  Created by 김영인 on 2022/11/24.
//

import Foundation

class MyCreditManager {
    var students: [Student] = []
    
    func addStudent() {
        print(Const.AddStudent.msg)
        let name = readLine()!
        
        // InputError
        
        if students.map({ $0.name }).firstIndex(of: name) != nil {
            print(name + Const.AddStudent.existErrorMsg)
        } else {
            students.append(Student(name: name, grade: []))
            print(name + Const.AddStudent.success)
        }
    }
    
    func deleteStudent() {
        print(Const.DeleteStudent.msg)
        let name = readLine()!
        
        // InputError
        
        if let studentIdx = students.map({ $0.name }).firstIndex(of: name) {
            students.remove(at: studentIdx)
            print(name + Const.DeleteStudent.success)
        } else {
            print(name + Const.DeleteStudent.errorMsg)
        }
    }
    
    func addGrade() {
        print(Const.AddGrade.msg)
        let grade = readLine()!.split(separator: " ").map { String($0) }
        
        // InputError
        
        let (name, subject, score) = (grade[0], grade[1], grade[2])
        
        if let studentIdx = students.map({ $0.name }).firstIndex(of: name) {
            students[studentIdx].grade.append(Grade(subject: subject, score: score))
            print("\(name) 학생의 \(subject) 과목이 \(score)로 추가(변경)되었습니다.")
        } else {
            print(Const.AddGrade.errorMsg)
        }
    }
    
    func deleteGrade() {
        print(Const.DeleteGrade.msg)
        let grade = readLine()!.split(separator: " ").map { String($0) }
        
        // InputError
        
        let (name, subject) = (grade[0], grade[1])
        
        if let studentIdx = students.map({ $0.name }).firstIndex(of: name) {
            if let gradeIdx = students[studentIdx].grade.map({ $0.subject }).firstIndex(of: subject) {
                students[studentIdx].grade.remove(at: gradeIdx)
                print("\(name) 학생의 \(subject) 과목의 성적이 삭제되었습니다.")
            } else {
                print(subject + Const.DeleteGrade.errorSubjectMsg)
            }
        } else {
            print(name + Const.DeleteStudent.errorMsg)
        }
    }
    
    func getScore(_ grade: String) -> Double {
        switch grade {
        case "A+":
            return 4.5
        case "A":
            return 4.0
        case "B+":
            return 3.5
        case "B":
            return 3.0
        case "C+":
            return 2.5
        case "C":
            return 2.0
        case "D+":
            return 1.5
        case "D":
            return 1.0
        case "F":
            return 0.0
        default:
            return -1
        }
    }
    
    func showGrade() {
        print(Const.ShowGrade.msg)
        let name = readLine()!
        
        // InputError
        
        if let studentIdx = students.map({ $0.name }).firstIndex(of: name) {
            var totalScore = 0.0
            let grades = students[studentIdx].grade
            grades.forEach {
                print("\($0.subject): \($0.score)")
                totalScore += getScore($0.score)
            }
            totalScore /= Double(grades.count)
            print("평점 : \(String(format: "%.2f", totalScore))")
        } else {
            print(name + Const.DeleteStudent.errorMsg)
        }
    }
    
    func exit() {
        print(Const.Exit.msg)
    }
}
