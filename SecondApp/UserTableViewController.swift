//
//  UserTableViewController.swift
//  SecondApp
//
//  Created by Claire on 1/3/25.
//

import UIKit

class UserTableViewController: UITableViewController {
    
    let name = ["칸쵸", "칙촉", "쿠크다스", "빼빼로", "씨리얼", "초코송이"]

    override func viewDidLoad() {
        super.viewDidLoad()

    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return name.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "userCell", for: indexPath) as! UserTableViewCell
        
        cell.profileImageView.backgroundColor = .blue
        cell.nameLabel.text = name[indexPath.row]
        cell.messageLabel.text = "상태 메시지"
        
        cell.nameLabel.font = .boldSystemFont(ofSize: 15)
        cell.messageLabel.font = .systemFont(ofSize: 12)
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }

}
