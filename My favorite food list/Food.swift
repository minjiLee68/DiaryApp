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
    
    mutating func update(foodDetail: String) {
        self.foodDetail = foodDetail
    }
    
    static func == (lhs: Self, rhs: Self) -> Bool {
        return lhs.id == rhs.id
    }
}

class FoodManager {
    static let shared = FoodManager()
    
    static var lastId: Int = 0
    
    var foods: [Food] = []
    
    func createFood(detail: String) -> Food {
        let nextId = FoodManager.lastId + 1
        FoodManager.lastId = nextId
        return  Food(id: nextId, foodDetail: detail)
    }
    
    func addFood(_ food: Food) {
        foods.append(food)
        saveFood()
    }
    
    func saveFood() {
        Storage.store(foods, to: .documents, as: "foods.json")
    }
    
    func retriveTodo() {
        foods = Storage.retrive("foods.json", from: .documents, as: [Food].self) ?? []
        
        let lastId = foods.last?.id ?? 0
        FoodManager.lastId = lastId
    }
}

class FoodViewModel {
    
    private let manager = FoodManager.shared
    
    var allCount: Int {
        return manager.foods.count
    }
    
    var foods: [Food] {
        return manager.foods
    }
    
    func addFood(_ food: Food) {
        manager.addFood(food)
    }
    
    func loadTasks() {
        manager.retriveTodo()
    }
}
