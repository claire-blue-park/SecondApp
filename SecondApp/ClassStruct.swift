//
//  ClassStruct.swift
//  SecondApp
//
//  Created by Claire on 1/2/25.
//

import Foundation

// 1. 가지고 있는 프로퍼티를 모두 초기화 -> let clothes = "Red"
// 2. 가지고 있는 프로퍼티를 옵셔널로 선언 -> var clothes: String?
class Monster {
    let clothes: String
    let speed: Int
    let power: Int
    let experiment: Int
    
    // 이니셜라이저
    init(clothes: String, speed: Int, power: Int, experiment: Int) {
        self.clothes = clothes
        self.speed = speed
        self.power = power
        self.experiment = experiment
    }
}

class BossMonster: Monster {
    
}

class SuperMonster: BossMonster {
    
}

struct MonsterStruct {
    let clothes: String
    let speed: Int
    let power: Int
    let experiment: Int
    
    // init이 없더라도 기본적으로 제공됨 -> memberwise initializer
}
