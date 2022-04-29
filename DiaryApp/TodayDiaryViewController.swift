//
//  TodayDiaryCollectionViewController.swift
//  My favorite food list
//
//  Created by 이민지 on 2022/04/28.
//

import UIKit

class TodayDiaryViewController: UIViewController {
    
    let cellTitle: [String] = ["매우 맑음☀️", "구름 조금🌤", "흐림☁️", "비🌧", "천둥번개🌩", "무지개🌈"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
    }
    
}

extension TodayDiaryViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 6
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "DiaryCell", for: indexPath) as? DiaryCell else { return UICollectionViewCell() }
        let title = self.cellTitle[indexPath.item]
        cell.update(title: title)
        return cell
    }
    
}

extension TodayDiaryViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let vc = self.storyboard?.instantiateViewController(withIdentifier: "diaryDetail") as? DiaryDetailViewController else {
            return
        }
        vc.tag = indexPath.item
        vc.modalPresentationStyle = .fullScreen
        self.navigationController?.pushViewController(vc, animated: true)
        print("cell \(indexPath.item)")
    }
}

class DiaryCell: UICollectionViewCell {
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var image: UIImageView!
    
    func update(title: String) {
        self.title.text = title
    }
}
