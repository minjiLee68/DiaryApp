//
//  MyFavoriteFoodViewController.swift
//  My favorite food list
//
//  Created by 이민지 on 2022/01/27.
//

import UIKit

class MyFavoriteFoodViewController: UIViewController {
    @IBOutlet weak var chinesefood: UIView!
    @IBOutlet weak var japanesefood: UIView!
    @IBOutlet weak var koreanfood: UIView!
    @IBOutlet weak var westernfood: UIView!
    @IBOutlet weak var dessert: UIView!
    @IBOutlet weak var beverage: UIView!
    
    @IBOutlet weak var chineseimage: UIImageView!
    @IBOutlet weak var japaneseimage: UIImageView!
    @IBOutlet weak var koreanimage: UIImageView!
    @IBOutlet weak var westernimage: UIImageView!
    @IBOutlet weak var desertimage: UIImageView!
    @IBOutlet weak var beverageimage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        uiViewDetail()
        imageCorenr()
        
        let concern1Gesture: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(tappedconcern1(_:)))
        let concern2Gesture: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(tappedconcern2(_:)))
        let concern3Gesture: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(tappedconcern3(_:)))
        let concern4Gesture: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(tappedconcern4(_:)))
        let concern5Gesture: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(tappedconcern5(_:)))
        let concern6Gesture: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(tappedconcern6(_:)))

        chinesefood.addGestureRecognizer(concern1Gesture)
        japanesefood.addGestureRecognizer(concern2Gesture)
        koreanfood.addGestureRecognizer(concern3Gesture)
        westernfood.addGestureRecognizer(concern4Gesture)
        dessert.addGestureRecognizer(concern5Gesture)
        beverage.addGestureRecognizer(concern6Gesture)
    }
}

extension MyFavoriteFoodViewController {
    @objc func tappedconcern1(_ gesture: UITapGestureRecognizer) {
        guard let vc = self.storyboard?.instantiateViewController(withIdentifier: "detailfood") as? DetailFoodViewController else {
            return
        }
        vc.modalPresentationStyle = .fullScreen
        vc.tag = 0
        present(vc, animated: true)
    }

    @objc func tappedconcern2(_ gesture: UITapGestureRecognizer) {
        guard let vc = self.storyboard?.instantiateViewController(withIdentifier: "detailfood") as? DetailFoodViewController else {
            return
        }
        vc.modalPresentationStyle = .fullScreen
        vc.tag = 1
        present(vc, animated: true)
    }

    @objc func tappedconcern3(_ gesture: UITapGestureRecognizer) {
        guard let vc = self.storyboard?.instantiateViewController(withIdentifier: "detailfood") as? DetailFoodViewController else {
            return
        }
        vc.modalPresentationStyle = .fullScreen
        vc.tag = 2
        present(vc, animated: true)
    }

    @objc func tappedconcern4(_ gesture: UITapGestureRecognizer) {
        guard let vc = self.storyboard?.instantiateViewController(withIdentifier: "detailfood") as? DetailFoodViewController else {
            return
        }
        vc.modalPresentationStyle = .fullScreen
        vc.tag = 3
        present(vc, animated: true)
    }

    @objc func tappedconcern5(_ gesture: UITapGestureRecognizer) {
        guard let vc = self.storyboard?.instantiateViewController(withIdentifier: "detailfood") as? DetailFoodViewController else {
            return
        }
        vc.modalPresentationStyle = .fullScreen
        vc.tag = 4
        present(vc, animated: true)
    }

    @objc func tappedconcern6(_ gesture: UITapGestureRecognizer) {
        guard let vc = self.storyboard?.instantiateViewController(withIdentifier: "detailfood") as? DetailFoodViewController else {
            return
        }
        vc.modalPresentationStyle = .fullScreen
        vc.tag = 5
        present(vc, animated: true)
    }
}

extension MyFavoriteFoodViewController {
    func uiViewDetail() {
        chinesefood.layer.cornerRadius = 20
        chinesefood.layer.shadowRadius = 5
        chinesefood.layer.shadowOffset = CGSize(width: 0, height: 3)
        chinesefood.layer.shadowColor = UIColor.black.cgColor
        chinesefood.layer.shadowOpacity = 0.3

        japanesefood.layer.cornerRadius = 20
        japanesefood.layer.shadowRadius = 5
        japanesefood.layer.shadowOffset = CGSize(width: 0, height: 3)
        japanesefood.layer.shadowColor = UIColor.black.cgColor
        japanesefood.layer.shadowOpacity = 0.3

        koreanfood.layer.cornerRadius = 20
        koreanfood.layer.shadowRadius = 5
        koreanfood.layer.shadowOffset = CGSize(width: 0, height: 3)
        koreanfood.layer.shadowColor = UIColor.black.cgColor
        koreanfood.layer.shadowOpacity = 0.3

        westernfood.layer.cornerRadius = 20
        westernfood.layer.shadowRadius = 5
        westernfood.layer.shadowOffset = CGSize(width: 0, height: 3)
        westernfood.layer.shadowColor = UIColor.black.cgColor
        westernfood.layer.shadowOpacity = 0.3

        dessert.layer.cornerRadius = 20
        dessert.layer.shadowRadius = 5
        dessert.layer.shadowOffset = CGSize(width: 0, height: 3)
        dessert.layer.shadowColor = UIColor.black.cgColor
        dessert.layer.shadowOpacity = 0.3

        beverage.layer.cornerRadius = 20
        beverage.layer.shadowRadius = 5
        beverage.layer.shadowOffset = CGSize(width: 0, height: 3)
        beverage.layer.shadowColor = UIColor.black.cgColor
        beverage.layer.shadowOpacity = 0.3
    }
    
    func imageCorenr() {
        chineseimage.layer.cornerRadius = 20
        chineseimage.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        chineseimage.layer.masksToBounds = true
        
        koreanimage.layer.cornerRadius = 20
        koreanimage.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        koreanimage.layer.masksToBounds = true
        
        westernimage.layer.cornerRadius = 20
        westernimage.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        westernimage.layer.masksToBounds = true
        
        japaneseimage.layer.cornerRadius = 20
        japaneseimage.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        japaneseimage.layer.masksToBounds = true
        
        desertimage.layer.cornerRadius = 20
        desertimage.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        desertimage.layer.masksToBounds = true
        
        beverageimage.layer.cornerRadius = 20
        beverageimage.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        beverageimage.layer.masksToBounds = true
    }
}
