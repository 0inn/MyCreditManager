//
//  Const.swift
//  MyCreditManager
//
//  Created by 김영인 on 2022/11/24.
//

import Foundation

struct Const {
    struct Input {
        static let msg = """
        원하는 기능을 입력해주세요
        1: 학생추가, 2: 학생삭제, 3: 성적추가(변경), 4: 성적삭제, 5: 평점보기. X: 종료
        """
        static let errorMsg = "뭔가 입력이 잘못되었습니다. 1~5 사이의 숫자 혹은 X를 입력해주세요."
    }
    
    struct AddStudent {
        static let msg = "추가할 학생의 이름을 입력해주세요"
        static let success = "학생을 추가했습니다."
        static let existErrorMsg = "은 이미 존재하는 학생입니다. 추가하지 않습니다."
    }
    
    struct DeleteStudent {
        static let msg = "삭제할 학생의 이름을 입력해주세요"
        static let errorMsg = "학생을 찾지 못했습니다."
        static let success = "학생을 삭제하였습니다."
    }
    
    struct AddGrade {
        static let msg = """
        성적을 추가할 학생의 이름, 과목 이름, 성적(A+, A, F 등)을 띄어쓰기로 구분하여 차례로 작성해주세요.
        입력예) Mickey Swift A+
        만약에 학생의 성적 중 해당 과목이 존재하면 기존 점수가 갱신됩니다.
        """
        static let errorGradeMsg = "존재하지 않는 성적입니다. A+, A 등의 형태로 입력해주세요."
    }
    
    struct DeleteGrade {
        static let msg = """
        성적을 삭제할 학생의 이름, 과목 이름을 띄어쓰기로 구분하여 차례로 작성해주세요.
        입력예) Mickey Swift
        """
        static let errorSubjectMsg = "과목을 찾지 못했습니다."
    }
    
    struct ShowGrade {
        static let msg = "평점을 알고싶은 학생의 이름을 입력해주세요"
    }

    struct Error {
        static let msg = "입력이 잘못되었습니다. 다시 확인해주세요."
    }
    
    struct Exit {
        static let msg = "프로그램을 종료합니다..."
    }
}
