//
//  Food.swift
//  My favorite food list
//
//  Created by 이민지 on 2022/01/28.
//

import UIKit

struct Diary: Codable, Equatable {
    let id: Int
    var title: String
    var diaryDetail: String
    var tag: Int
    
    mutating func update(title: String, diaryDetail: String) {
        self.title = title
        self.diaryDetail = diaryDetail
//        self.tag = tag
    }
    
    static func == (lhs: Self, rhs: Self) -> Bool {
        return lhs.id == rhs.id
    }
}

class DiaryManager {
    static let shared = DiaryManager()
    
    static var lastId: Int = 0
    
    var diarys: [Diary] = []
    
    func createDiary(title: String, detail: String, tag: Int) -> Diary {
        let nextId = DiaryManager.lastId + 1
        DiaryManager.lastId = nextId
        return Diary(id: nextId, title: title, diaryDetail: detail, tag: tag)
    }
    
    func addDiary(_ diary: Diary) {
        diarys.append(diary)
        saveDiary()
    }
    
    func deleteDiary(_ diary: Diary) {
        diarys = diarys.filter { $0.id != diary.id }
        saveDiary()
    }
    
    func updateDiary(diary: Diary) {
        guard let index = diarys.firstIndex(of: diary) else { return }
        diarys[index].update(title: diary.title, diaryDetail: diary.diaryDetail)
        saveDiary()
    }
    
    func saveDiary() {
        Storage.store(diarys, to: .documents, as: "diary.json")
    }
    
    func retriveDiary() {
        diarys = Storage.retrive("diary.json", from: .documents, as: [Diary].self) ?? []
        
        let lastId = diarys.last?.id ?? 0
        DiaryManager.lastId = lastId
    }
}

class DiaryViewModel{
    
    private let manager = DiaryManager.shared
    
    func sectionDiaryData(tag: Int) -> [Diary] {
        return manager.diarys.filter{ $0.tag == tag }
    }
    
    var diarys: [Diary] {
        return manager.diarys
    }
    
    func addDiary(_ diary: Diary) {
        manager.addDiary(diary)
    }
    
    func deleteDiary(_ diary: Diary) {
        manager.deleteDiary(diary)
    }
    
    func updateDiary(_ diary: Diary) {
        manager.updateDiary(diary: diary)
    }
    
    func loadTasks() {
        manager.retriveDiary()
    }
}
