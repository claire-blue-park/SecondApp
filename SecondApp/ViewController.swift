//
//  ViewController.swift
//  SecondApp
//
//  Created by Claire on 12/30/24.
//

import UIKit
import Kingfisher

class ViewController: UIViewController {

    @IBOutlet var recommendButton: UIButton!
    @IBOutlet var wordTextField: UITextField!
    @IBOutlet var resultLabel: UILabel!
    
    @IBOutlet var posterImageView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        recommendButton.isEnabled = true
        resultLabel.isUserInteractionEnabled = true
        
        let url = URL(string: "https://pbs.twimg.com/media/FbAEhR9acAEQ3Sn?format=jpg&name=4096x4096")
        posterImageView.kf.setImage(with: url)

    }


    @IBAction func textFieldReturnKeyTapped(_ sender: UITextField) {
        let text = wordTextField.text!
//        resultLabel.text = text // 오류 없음, 모두 nil을 가질 수 있음
//        resultLabel.text = "\(text)라고 입력했어요!"
        
        resultLabel.text = if text.count == 0 {
            "검색어를 작성해주세요."
        } else if text == "jmt" {
            "완전맛있음"
        } else {
            "\(text)라고 입력했어요!"
        }
    }
    
    func aboutOptional() {
        // : String? 옵셔널 스트링 타입
        var nickname: String? = "칸쵸"
        var age: Int? = 22
        
        nickname = nil
    
        // 1. 조건문을 통해 옵셔널 언래핑
        if nickname ==  nil {
            print("닉네임에 문제가 있어요.")
        } else {
            print("\(nickname!)으로 설정합니다.")
        }
        
        if nickname !=  nil {
            print("\(nickname!)으로 설정합니다.")
        } else {
            print("닉네임에 문제가 있어요.")
        }
        
        // 2. 옵셔널 바인딩: if let / guard
        // Swift 5.7 if let shorthand
        // 어차피 개발자들 이름 짓기도 귀찮아 하고 같은 이름 두 번 씀
        // if let nickname { ... } 으로 생략하고 써도 됨
        if let nickname = nickname { // 두 가지의 변수 타입이 다름
            print("\(nickname)으로 설정합니다.")
        } else {
            print("닉네임에 문제가 있어요.")
        }
        
        if let age = age { // Optional에 대해 언래핑된 age 변수는 해당 블록에서만 사용 가능
            print(age)
        } else {
            print("나이가 nil입니다.")
        }
        
        // 3. guard let
        // if let은 nil이 아닌 것에 먼저 대응
        // guard let은 반대로 nil에 대해 먼저 대응
        guard let age else {
            // nil 값일 때
            // !!주의 사항!! 무조건 값 프린트 찍어볼 것
            print("옵셔널 해제를 실패함, age == nil")
            return // guard구문에서 리턴을 쓰는 이유
            // 리턴은 반환값에 대해서 쓰임, 끝내는 자리
            // 사실 모든 함수에는 리턴이라는 것이 있다고 보면 됨
            // 이 내부가 쓰여졌다면 age는 nil값이므로 이 이후 코드가 실행되었을 경우 문제가 생길 수 있으므로
            // guard let 구문에서는 막는 용도로 사용됨
        }
        print(age) // 옵셔널 Int가 아닌 Int, if let과 사용 범주가 다름, 이 친구는 guard let 바깥에서 사용 가능
        
        // 4. ??
        print(nickname ?? "손님")
        
        // 5. 옵셔널 체이닝
        print(wordTextField.text?.count) // nil인지 아닌지 판단 후 nil일 경우 이후 코드를 실행하지 않음
    }
    
}

