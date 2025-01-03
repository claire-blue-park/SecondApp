//
//  NumberViewController.swift
//  SecondApp
//
//  Created by Claire on 12/30/24.
//

import UIKit

class NumberViewController: UIViewController {
    
    @IBOutlet var dateLabel: UILabel!
    @IBOutlet var resultLabel: UILabel!
    @IBOutlet var numberTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setViewBackground()
        
        dateLabel.text = getToday()
        
        print(NSHomeDirectory())
        
        
        // UserDefaults에 저장된 데이터 가져오기
        // 가져올 때는 타입 명세 필요, Optional 타입으로 가져올 수 있음
        let result = UserDefaults.standard.string(forKey: "number")
        numberTextField.text = result
    }
    // Swift 5.1: Implicit returns
    // 암묵적으로 생략 가능한 리턴, 한 줄일때만 가능
    func randomInt() -> Int {
        Int.random(in: 1...100)
    }
    
    // 매개변수, 반환값이 없는 함수
    func today() {
        
    }
    
    // 반환값이 있음
    // @discardableResult 반환값 사용하지 않는다고 Attributes로 명시
    // Swift에서 골뱅이는 Attributes
    @discardableResult
    func getToday() -> String {
        let format = DateFormatter()
        format.dateFormat = "yyyy년 MM월 dd일"
        let today = format.string(from: Date())
        print(today)
        
        return today
    }
    
    // EVENT: -Editing Changed
    @IBAction
    func textFieldTextChanged(_ sender: UITextField) {
//        resultLabel.text = if Int(sender.text ?? "") == nil {
//            "숫자 아님"
//        } else { sender.text }
        
        // 1. 실시간으로 레이블에 반영 확인
        // Optional String -> String
        // 특정 TextField 등에서 값을 가져오는 경우에는 shorthand 불가
        guard let jack = numberTextField.text else {
            print("옵셔널 오류")
            return
        }
        
        print(Int(jack)) // 문자를 Int 타입으로 형변환하려고 시도할 경우 nil값 발생
        resultLabel.text = jack
        
        // 1.
//        if Int(jack) != nil {
//            print(Int(jack)!)
//        } else {
//            print("숫자 아닙니다.")
//        }
        
        // 2.
//        if let intJack = Int(jack) {
//            resultLabel.text = "\(intJack)"
//        } else {
//            resultLabel.text = "숫자가 아닙니다."
//        }
        
        // 3.
//        guard let intJack = Int(jack) else {
//            resultLabel.text = "숫자 아닙니다."
//            return
//        }
//        resultLabel.text = "\(intJack)"
        
    }

    @IBAction
    func saveButtonTapped(_ sender: UIButton) {
        // 텍스트필드에 적었던 내용을 영구적으로 저장
        UserDefaults.standard.set(numberTextField.text, forKey: "number")
        print(#function)
        
        // 사용자에게 성공적으로 저장이 되었음을 알리기 -> Alert
        // 1. 타이틀 + 메시지
        let alert = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
        
        // 2. 버튼
        let defaultButton = UIAlertAction(title: "default", style: .default)
        let destructiveButton = UIAlertAction(title: "destructive", style: .destructive)
        let cancelButton = UIAlertAction(title: "cancel", style: .cancel)
        
        // 3. 본문에 버튼 추가
        alert.addAction(defaultButton)
        alert.addAction(destructiveButton)
        alert.addAction(cancelButton)
        
        // 4. 화면에 띄우기
        present(alert, animated: true)
    }
}
