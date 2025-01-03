//
//  PracticeViewController.swift
//  SecondApp
//
//  Created by Claire on 12/31/24.
//

import UIKit

class PracticeViewController: UIViewController {
    
    let colorList: [UIColor] = [.red, .yellow, .green, .orange, .purple, .cyan]

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = colorList.randomElement()!
        print(self, #function)
        
    }
    
    // iOS 13+
    override func viewIsAppearing(_ animated: Bool) {
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print(self, #function)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print(self, #function)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        print(self, #function)
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        print(self, #function)
    }
    
    // 전체 화면이 된 모달에서 뒤로가기 만들기
    // A - full -> B
    // A에 언와인드 펑션, 터널 기능
    // 스토리 보드에서 연결하는 것이 아니라 코드로 직접 타이핑 필요
    @IBAction func unwindToPracticeViewController(_ sender: UIStoryboardSegue) {
        print(#function)
    }

}
