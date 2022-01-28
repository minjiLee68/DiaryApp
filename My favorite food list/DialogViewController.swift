//
//  DialogViewController.swift
//  My favorite food list
//
//  Created by 이민지 on 2022/01/28.
//

import UIKit

class DialogViewController: UIViewController {
    
    @IBOutlet weak var saveButton: UIButton!
    @IBOutlet weak var viewUI: UIView!
    @IBOutlet weak var inputText: UITextField!
    
    let foodViewModel = FoodViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        viewDesign()
            
//        saveButton.addTarget(self, action: #selector(dismissView), for: .touchUpInside)
    }
    
//    @objc func dismissView() {
//        dismiss(animated: false, completion: nil)
//    }
    
    func viewDesign() {
        viewUI.layer.cornerRadius = 20
        saveButton.layer.cornerRadius = 15
    }
    
    @IBAction func tapBG(_ sender: Any) {
        self.dismiss(animated: false, completion: nil)
    }
    
    @IBAction func addTaskButtonTapped(_ sender: Any) {
        guard let detail = inputText.text, detail.isEmpty == false else { return }
        let food = FoodManager.shared.createFood(detail: detail)
        foodViewModel.addFood(food)
        self.presentingViewController?.dismiss(animated: true, completion: nil)    }
}
