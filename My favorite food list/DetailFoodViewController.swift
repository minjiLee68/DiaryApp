//
//  DetailFoodViewController.swift
//  My favorite food list
//
//  Created by 이민지 on 2022/01/27.
//

import UIKit

class DetailFoodViewController: UIViewController {
    @IBOutlet weak var addButton: UIButton!
    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var foodName: UILabel!
    @IBOutlet weak var viewUI: UIView!
    
    var tag: Int = 0
    
    let foodViewModel = FoodViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        foodViewModel.loadTasks()
        
        NotificationCenter.default.addObserver(self, selector: #selector(detailViewController(_:)), name: NSNotification.Name("dialogPostViewController"), object: nil)
        
        tableView.backgroundColor = UIColor.secondarySystemBackground
        addButton.addTarget(self, action: #selector(goAlert), for: .touchUpInside)
    }
    
    @objc func detailViewController(_ noti: Notification) {
        OperationQueue.main.addOperation {
            self.tableView.reloadData()
        }
    }
    
    @objc func goAlert() {
        let alert = self.storyboard?.instantiateViewController(withIdentifier: "dialog") as! DialogViewController
        alert.modalPresentationStyle = .overCurrentContext
        alert.tag = tag
        present(alert, animated: false, completion: nil)
    }
    
    @IBAction func respondToSwipeGesture(_ sender: UISwipeGestureRecognizer) {
        switch sender.direction {
        case UISwipeGestureRecognizer.Direction.right :
            self.dismiss(animated: true, completion: nil)
        default: break
        }
    }
    
    @IBAction func backTapButton(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
    func swipeRecognizer() {
        let swipeRight = UISwipeGestureRecognizer(target: self, action: #selector(respondToSwipeGesture(_:)))
        swipeRight.direction = .right
        self.view.addGestureRecognizer(swipeRight)
    }
}

extension DetailFoodViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return foodViewModel.allCount.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "DetailListCell", for: indexPath) as? DetailListCell else { return UITableViewCell() }
        
        self.view.tag = tag
        var food: Food
        food = foodViewModel.allCount[indexPath.item]
        if food.tag == tag {
            print("---> \(food)")
            print("--> \(tag)")
            cell.updateUI(food: food)
        } else { return UITableViewCell() }
        return cell
    }
}

extension DetailFoodViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        return nil
    }
}

class DetailListCell: UITableViewCell {
    @IBOutlet weak var foodName: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
    }
    
    func updateUI(food: Food) {
        foodName.text = food.foodDetail
    }
}
