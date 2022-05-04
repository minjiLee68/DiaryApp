//
//  DetailFoodViewController.swift
//  My favorite food list
//
//  Created by 이민지 on 2022/01/27.
//

import UIKit

class DiaryDetailViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var viewUI: UIView!
    
    var tag: Int = 0
    
    let diaryViewModel = DiaryViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        NotificationCenter.default.addObserver(self, selector: #selector(detailViewController(_:)), name: NSNotification.Name("dialogPostViewController"), object: nil)
        
        navigationBtn()
        diaryViewModel.loadTasks()
        uiDesign()
    }
    
    private func navigationBtn() {
        let saveButton = UIBarButtonItem(barButtonSystemItem: .compose, target: self, action: #selector(submit(_:)))
        self.navigationItem.rightBarButtonItem = saveButton
    }
    
    @objc func submit(_ sender: Any) {
        let alert = self.storyboard?.instantiateViewController(withIdentifier: "dialog") as! DialogViewController
        alert.modalPresentationStyle = .overCurrentContext
        alert.tag = self.tag
        self.present(alert, animated: false, completion: nil)
    }

    func swipeRecognizer() {
        let swipeRight = UISwipeGestureRecognizer(target: self, action: #selector(respondToSwipeGesture(_:)))
        swipeRight.direction = .right
        self.view.addGestureRecognizer(swipeRight)
    }
    
    func uiDesign() {
        tableView.backgroundColor = .clear
        tableView.contentInset = .zero
        tableView.contentInsetAdjustmentBehavior = .never
    }
    
    @objc func detailViewController(_ noti: Notification) {
        OperationQueue.main.addOperation {
            self.tableView.reloadData()
        }
    }
    
    @IBAction func respondToSwipeGesture(_ sender: UISwipeGestureRecognizer) {
        switch sender.direction {
        case UISwipeGestureRecognizer.Direction.right :
            self.dismiss(animated: true, completion: nil)
        default: break
        }
    }
}

extension DiaryDetailViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return diaryViewModel.sectionDiaryData(tag: self.tag).count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "DetailListCell", for: indexPath) as? DetailListCell else { return UITableViewCell() }
        var diary: Diary
        diary = diaryViewModel.sectionDiaryData(tag: self.tag)[indexPath.item]
        print(diary)
        cell.updateUI(diary)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        .leastNonzeroMagnitude
    }
}

extension DiaryDetailViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        tableView.rowHeight = 30
        return nil
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let actions1 = UIContextualAction(style: .normal, title: "삭제", handler: { action, view, completionHandler in
            var diary: Diary
            diary = self.diaryViewModel.sectionDiaryData(tag: self.tag)[indexPath.item]
            self.diaryViewModel.deleteDiary(diary)
            self.tableView.reloadData()
            completionHandler(true)
        })
        actions1.backgroundColor = .systemRed
        return UISwipeActionsConfiguration(actions: [actions1])
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let dvc = self.storyboard?.instantiateViewController(withIdentifier: "dialog") as? DialogViewController else { return }
        var diary: Diary
        diary = self.diaryViewModel.sectionDiaryData(tag: self.tag)[indexPath.item]
        dvc.indexId = diary.id
        print("id \(diary.id)")
        DispatchQueue.main.async {
            dvc.readAndUpdating(diary: diary)
        }
        dvc.modalPresentationStyle = .overCurrentContext
        self.present(dvc, animated: true, completion: nil)
    }
}

class DetailListCell: UITableViewCell {
    @IBOutlet weak var title: UILabel!
        
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
    }
    
    func updateUI(_ diary: Diary) {
        title.text = diary.title
    }
}
