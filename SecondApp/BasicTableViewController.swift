//
//  TableViewController.swift
//  SecondApp
//
//  Created by Claire on 1/2/25.
//

import UIKit

class BasicTableViewController: UITableViewController {
    
    var list = ["프로젝트", "쇼핑", "메인업무", "새싹과제"] {
        didSet {
            tableView.reloadData()
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let monster = Monster(clothes: "Blue", speed: 10, power: 5, experiment: 5) // 인스턴스
        
//        tableView.rowHeight = 80
//        tableView.allowsSelection = false // 셀선택 불가

    }
    
    @IBAction func randomTextTapped(_ sender: UIBarButtonItem) {
        let randomTexts = ["칸쵸", "빼빼로", "초코송이", "고래밥", "통크", "칙촉", "씨리얼", "예감", "야채타임", "아우터", "포카칩"].shuffled()
        list.append(randomTexts.randomElement() ?? "초코파이")
        tableView.reloadData()
    }
    
    
    // 1. 셀의 갯수: number
    // 몇 개의 셀을 생성해야 할 지 iOS 시스템에게 알려주기 위함
    override func numberOfSections(in tableView: UITableView) -> Int {
        // 옵션 사항, 섹션의 갯수를 리턴하므로 섹션이 나눠지지 않을 경우 작성할 필요없다
        // 기본적으로 1을 리턴
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // 필수적으로 셀의 갯수를 리턴
        print(#function)
        return list.count
    }
    
    //2. 셀 디자인 및 데이터 처리
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "claireCell")!
        
        cell.textLabel?.text = list[indexPath.row]
//        cell.detailTextLabel?.text = "디테일 텍스트 레이블"
        cell.detailTextLabel?.setPrimaryLabel("test")
        
//        if indexPath.row == 0 {
//            cell.textLabel?.text = list[0]
//        } else if indexPath.row == 1 {
//            cell.textLabel?.text = list[1]
//        } else if indexPath.row == 2 {
//            cell.textLabel?.text = list[2]
//        } else {
//            cell.textLabel?.text = "오류"
//        }
        
        cell.textLabel?.textColor = .blue
        cell.textLabel?.textColor = indexPath.row % 2 == 0 ? .red : .blue
        
        cell.backgroundColor = (0...3).contains(indexPath.row) ? .gray : nil
        
        cell.textLabel?.font = .systemFont(ofSize: 24)
        
        print(#function, indexPath)
        return cell
    }
    
    // 3. 셀 높이: height
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        print(#function)
        
        let height = if indexPath.section == 0 { 80.0 } else { 100.0 }
        
        return height
    }
    
    // 셀 클릭되었을 때 실행
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(#function)
        list.remove(at: indexPath.row)
        tableView.reloadData()
    }
    
    override func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        return .delete
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            tableView.beginUpdates()
            list.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
            tableView.endUpdates()
        }
    }
    
}
