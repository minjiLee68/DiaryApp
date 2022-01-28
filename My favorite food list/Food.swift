//
//  Food.swift
//  My favorite food list
//
//  Created by 이민지 on 2022/01/28.
//

import UIKit

struct Food: Codable, Equatable {
    let id: Int
    var foodDetail: String
    var tag: Int
    
    mutating func update(foodDetail: String, tag: Int) {
        self.foodDetail = foodDetail
        self.tag = tag
    }
    
    static func == (lhs: Self, rhs: Self) -> Bool {
        return lhs.id == rhs.id
    }
}

class FoodManager {
    static let shared = FoodManager()
    
    static var lastId: Int = 0
    
    var foods: [Food] = []
    
    func createFood(detail: String, tag: Int) -> Food {
        let nextId = FoodManager.lastId + 1
        FoodManager.lastId = nextId
        return  Food(id: nextId, foodDetail: detail, tag: tag)
    }
    
    func addFood(_ food: Food) {
        foods.append(food)
        saveFood()
    }
    
    func saveFood() {
        Storage.store(foods, to: .documents, as: "foods.json")
    }
    
    func retriveFood() {
        foods = Storage.retrive("foods.json", from: .documents, as: [Food].self) ?? []
        
        let lastId = foods.last?.id ?? 0
        FoodManager.lastId = lastId
    }
}

class FoodViewModel {
    
    private let manager = FoodManager.shared
    
//    var numOfSection: Int {
//        return Section.allCases.count
//    }
    
    var allCount: [Food] {
        return manager.foods
    }
    
//    var case1: [Food] {
//        return foods.filter { $0.tag == 0 }
//    }
//
//    var case2: [Food] {
//        return foods.filter { $0.tag == 1 }
//    }
//
//    var case3: [Food] {
//        return foods.filter { $0.tag == 2 }
//    }
//
//    var case4: [Food] {
//        return foods.filter { $0.tag == 3 }
//    }
//
//    var case5: [Food] {
//        return foods.filter { $0.tag == 4 }
//    }
//
//    var case6: [Food] {
//        return foods.filter { $0.tag == 5 }
//    }
    
    var foods: [Food] {
        return manager.foods
    }
    
    func addFood(_ food: Food) {
        manager.addFood(food)
    }
    
    func loadTasks() {
        manager.retriveFood()
    }
}
