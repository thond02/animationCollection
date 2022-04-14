//
//  ViewController.swift
//  CustomCollectionView
//
//  Created by Ahmed Abdallah on 10.12.2019.
//  Copyright © 2019 4A5. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

  @IBOutlet weak var scrollView: UIScrollView!
  @IBOutlet weak var collectionView: UICollectionView!
  @IBOutlet weak var cVWidth: NSLayoutConstraint!
  override func viewDidLoad() {
    super.viewDidLoad()
    
    setupCollectionView()
      
      scrollView.delegate = self
  }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
//        DispatchQueue.main.asyncAfter(deadline: .now() + 10) {
//            self.scrollY(self.collectionView)
//            self.scrollX(self.scrollView)
//
//        }
        
    }
    
    func scrollY(_ collectionView: UIScrollView) {
        var currentOffsetY = collectionView.contentOffset.y + 20
        collectionView.setContentOffset(CGPoint(x: 0, y: currentOffsetY), animated: true)
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.05) {
            self.scrollY(collectionView)
        }
    }
    
    func scrollX(_ collectionView: UIScrollView) {
        var currentOffsetX = collectionView.contentOffset.x + 20
        collectionView.setContentOffset(CGPoint(x: currentOffsetX, y: 0), animated: true)
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.05) {
            self.scrollX(collectionView)
        }
    }
}

extension ViewController {
  func setupCollectionView() {
    collectionView.delegate = self
    collectionView.dataSource = self
    cVWidth.constant = 5000
    scrollView.contentSize = collectionView.frame.size
    collectionView.register(UINib(nibName: CustomCollectionViewCell.identifier, bundle: nil), forCellWithReuseIdentifier: CustomCollectionViewCell.identifier)
    
  }
}

extension ViewController: UICollectionViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        print("######scroll###########")
        print(self.scrollView.contentOffset)
        print("+++++coloection+++++++++++++")
        print(self.collectionView.contentOffset)
    }
}

extension ViewController: UICollectionViewDataSource {
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    1000
  }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1000
    }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CustomCollectionViewCell.identifier, for: indexPath) as! CustomCollectionViewCell
    let row = indexPath.row
      cell.titleLBL.text = "\(row) \(indexPath.section)"
    if row % 2 == 0 {
      cell.backgroundColor = .red
    } else {
      cell.backgroundColor = .green
    }
    return cell
  }
}

extension ViewController: UICollectionViewDelegateFlowLayout{
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
      return CGSize(width: (UIScreen.main.bounds.width) , height: (UIScreen.main.bounds.height))
      image.size
  }
  
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
    return 0.0
  }
  
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
    return 0.0
  }
}