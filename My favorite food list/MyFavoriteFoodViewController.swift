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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        uiViewDetail()
        
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
        guard let vc = self.storyboard?.instantiateViewController(withIdentifier: "detailfood") else {
            return
        }
        vc.modalPresentationStyle = .fullScreen
        present(vc, animated: true)
    }

    @objc func tappedconcern2(_ gesture: UITapGestureRecognizer) {
        guard let vc = self.storyboard?.instantiateViewController(withIdentifier: "detailfood") else {
            return
        }
        vc.modalTransitionStyle = UIModalTransitionStyle.coverVertical
        present(vc, animated: true)
    }

    @objc func tappedconcern3(_ gesture: UITapGestureRecognizer) {
        guard let vc = self.storyboard?.instantiateViewController(withIdentifier: "detailfood") else {
            return
        }
        vc.modalTransitionStyle = UIModalTransitionStyle.coverVertical
        present(vc, animated: true)
    }

    @objc func tappedconcern4(_ gesture: UITapGestureRecognizer) {
        guard let vc = self.storyboard?.instantiateViewController(withIdentifier: "detailfood") else {
            return
        }
        vc.modalTransitionStyle = UIModalTransitionStyle.coverVertical
        present(vc, animated: true)
    }

    @objc func tappedconcern5(_ gesture: UITapGestureRecognizer) {
        guard let vc = self.storyboard?.instantiateViewController(withIdentifier: "detailfood") else {
            return
        }
        vc.modalTransitionStyle = UIModalTransitionStyle.coverVertical
        present(vc, animated: true)
    }

    @objc func tappedconcern6(_ gesture: UITapGestureRecognizer) {
        guard let vc = self.storyboard?.instantiateViewController(withIdentifier: "detailfood") else {
            return
        }
        vc.modalTransitionStyle = UIModalTransitionStyle.coverVertical
        present(vc, animated: true)
    }
}

extension MyFavoriteFoodViewController {
    func uiViewDetail() {
        chinesefood.layer.cornerRadius = 10
        chinesefood.layer.shadowRadius = 5
        chinesefood.layer.shadowOffset = CGSize(width: 0, height: 3)
        chinesefood.layer.shadowColor = UIColor.black.cgColor
        chinesefood.layer.shadowOpacity = 0.3

        japanesefood.layer.cornerRadius = 10
        japanesefood.layer.shadowRadius = 5
        japanesefood.layer.shadowOffset = CGSize(width: 0, height: 3)
        japanesefood.layer.shadowColor = UIColor.black.cgColor
        japanesefood.layer.shadowOpacity = 0.3

        koreanfood.layer.cornerRadius = 10
        koreanfood.layer.shadowRadius = 5
        koreanfood.layer.shadowOffset = CGSize(width: 0, height: 3)
        koreanfood.layer.shadowColor = UIColor.black.cgColor
        koreanfood.layer.shadowOpacity = 0.3

        westernfood.layer.cornerRadius = 10
        westernfood.layer.shadowRadius = 5
        westernfood.layer.shadowOffset = CGSize(width: 0, height: 3)
        westernfood.layer.shadowColor = UIColor.black.cgColor
        westernfood.layer.shadowOpacity = 0.3

        dessert.layer.cornerRadius = 10
        dessert.layer.shadowRadius = 5
        dessert.layer.shadowOffset = CGSize(width: 0, height: 3)
        dessert.layer.shadowColor = UIColor.black.cgColor
        dessert.layer.shadowOpacity = 0.3

        beverage.layer.cornerRadius = 10
        beverage.layer.shadowRadius = 5
        beverage.layer.shadowOffset = CGSize(width: 0, height: 3)
        beverage.layer.shadowColor = UIColor.black.cgColor
        beverage.layer.shadowOpacity = 0.3
    }
}
