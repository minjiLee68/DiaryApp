//
//  DialogViewController.swift
//  My favorite food list
//
//  Created by 이민지 on 2022/01/28.
//

import UIKit

class DialogViewController: UIViewController {
    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var saveButton: UIButton!
    @IBOutlet weak var viewUI: UIView!
    @IBOutlet weak var dialogView: UIView!
    @IBOutlet weak var diaryTextView: UITextView!
    
    var tag: Int = 0
    var indexId: Int = 0
    var saveAndUpdate: Bool = false
    
    let diaryViewModel = DiaryViewModel()
    let DialogPostViewController: Notification.Name = Notification.Name("dialogPostViewController")

    override func viewDidLoad() {
        super.viewDidLoad()
        viewDesign()
    }
    
    func viewDesign() {
        viewUI.layer.cornerRadius = 15
        saveButton.layer.cornerRadius = 15
    }
    
    func readAndUpdating(diary: Diary) {
        titleTextField.text = diary.title
        diaryTextView.text = diary.diaryDetail
        saveButton.titleLabel?.text = "수정"
        saveAndUpdate = true
    }
    
     @IBAction func tapBG(_ sender: Any) {
        self.dismiss(animated: false, completion: nil)
    }
    
    @IBAction func addTaskButtonTapped(_ sender: Any) {
        guard let title = titleTextField.text, title.isEmpty == false else { return }
        guard let detail = diaryTextView.text, detail.isEmpty == false else { return }
        self.view.tag = tag
        
        if saveAndUpdate == false {
            let diary = DiaryManager.shared.createDiary(title: title, detail: detail, tag: tag)
            diaryViewModel.addDiary(diary)
        } else if saveAndUpdate == true {
            let diary = Diary(id: indexId, title: title, diaryDetail: detail, tag: tag)
            diaryViewModel.updateDiary(diary)
        }
        self.presentingViewController?.dismiss(animated: true, completion: nil)
        NotificationCenter.default.post(name: DialogPostViewController, object: nil, userInfo: nil)
    }
}
