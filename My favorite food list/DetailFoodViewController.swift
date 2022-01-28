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
    
    let foodViewModel = FoodViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.backgroundColor = UIColor.secondarySystemBackground
        foodViewModel.loadTasks()
    }
    
    func swipeRecognizer() {
        let swipeRight = UISwipeGestureRecognizer(target: self, action: #selector(respondToSwipeGesture(_:)))
        swipeRight.direction = .right
        self.view.addGestureRecognizer(swipeRight)
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
}

extension DetailFoodViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return foodViewModel.allCount
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "DetailListCell", for: indexPath) as? DetailListCell else { return UITableViewCell() }
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
