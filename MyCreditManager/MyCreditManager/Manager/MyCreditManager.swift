//
//  MyCreditManager.swift
//  MyCreditManager
//
//  Created by 김영인 on 2022/11/24.
//

import Foundation

class MyCreditManager {
    var students: [Student] = []
    
    func checkInput(_ input: InputType) -> String? {
        print(input.msg)
        
        if let cmd = readLine() {
            if cmd.checkValid() {
                return cmd
            } else {
                print(input.errorMsg)
                return nil
            }
        } else {
            print(input.errorMsg)
            return nil
        }
    }
    
    func addStudent() {
        guard let name = checkInput(.addStudent) else { return }
        
        if students.map({ $0.name }).firstIndex(of: name) != nil {
            print(name + Const.AddStudent.existErrorMsg)
        } else {
            students.append(Student(name: name, grade: []))
            print(name + Const.AddStudent.success)
        }
    }
    
    func deleteStudent() {
        guard let name = checkInput(.deleteStudent) else { return }
        
        if let studentIdx = students.map({ $0.name }).firstIndex(of: name) {
            students.remove(at: studentIdx)
            print(name + Const.DeleteStudent.success)
        } else {
            print(name + Const.DeleteStudent.errorMsg)
        }
    }
    
    func addGrade() {
        guard let info = checkInput(.addGrade) else { return }
        
        let grade = info.split(separator: " ").map { String($0) }
        
        if grade.count < 3 {
            print(Const.Error.msg)
            return
        }
        
        let (name, subject, score) = (grade[0], grade[1], grade[2])
        
        if getScore(score) == -1 {
            print(Const.AddGrade.errorGradeMsg)
            return
        }
        
        if let studentIdx = students.map({ $0.name }).firstIndex(of: name) {
            students[studentIdx].grade.append(Grade(subject: subject, score: score))
            print("\(name) 학생의 \(subject) 과목이 \(score)로 추가(변경)되었습니다.")
        } else {
            print(name + Const.DeleteStudent.errorMsg)
        }
    }
    
    func deleteGrade() {
        guard let info = checkInput(.deleteGrade) else { return }
        
        let grade = info.split(separator: " ").map { String($0) }
        
        if grade.count < 2 {
            print(Const.Error.msg)
            return
        }

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
        guard let name = checkInput(.showGrade) else { return }
        
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
