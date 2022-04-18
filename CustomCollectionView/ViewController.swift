//
//  ViewController.swift
//  CustomCollectionView
//
//  Created by Ahmed Abdallah on 10.12.2019.
//  Copyright © 2019 4A5. All rights reserved.
//

import UIKit
//let width = 1148.0//UIScreen.main.bounds.width
//let height = 1634.0//UIScreen.main.bounds.height
let width = (UIScreen.main.bounds.height)*976.0/1389.0
let height = (UIScreen.main.bounds.height)
//let width = 976.0
//let height = 1389.0
class ViewController: UIViewController {
let loop = 20
    let movementStep = 20.0
  @IBOutlet weak var scrollView: UIScrollView!
  @IBOutlet weak var collectionView: UICollectionView!
  @IBOutlet weak var cVWidth: NSLayoutConstraint!
  override func viewDidLoad() {
    super.viewDidLoad()
    
    setupCollectionView()
      
      scrollView.delegate = self
      collectionView.scrollToItem(at: IndexPath(item: loop-1, section: loop-1), at: .bottom, animated: false)

      let bottomOffset = CGPoint(x: cVWidth.constant - width, y: 0)
      scrollView.setContentOffset(bottomOffset, animated: false)

  }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.03) {
            self.scrollY(self.collectionView)
            self.scrollX(self.scrollView)

        }
    }
    
    @IBAction func nexxt(_ sender: Any) {
        print("neeeeeeeexxttttt")
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)

        
    }
    func scrollY(_ collectionView: UIScrollView) {
        var currentOffsetY = collectionView.contentOffset.y - movementStep
        if currentOffsetY < 0 {
            self.collectionView.scrollToItem(at: IndexPath(item: loop-1, section: loop-1), at: .bottom, animated: false)

            let bottomOffset = CGPoint(x: cVWidth.constant - width, y: 0)
            scrollView.setContentOffset(bottomOffset, animated: false)
            self.scrollY(self.collectionView)
            self.scrollX(self.scrollView)
            print("thond:new \(Date())")
            return
        }
        collectionView.setContentOffset(CGPoint(x: 0, y: currentOffsetY), animated: true)
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.05) {
            self.scrollY(collectionView)
        }
    }
    
    func scrollX(_ collectionView: UIScrollView) {
        var currentOffsetX = collectionView.contentOffset.x - movementStep
        if currentOffsetX < 0 {
            self.collectionView.scrollToItem(at: IndexPath(item: loop-1, section: loop-1), at: .bottom, animated: false)

            let bottomOffset = CGPoint(x: cVWidth.constant - width, y: 0)
            scrollView.setContentOffset(bottomOffset, animated: false)
            self.scrollY(self.collectionView)
            self.scrollX(self.scrollView)
            print("thond:new \(Date())")
            return
        }
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
      cVWidth.constant = width*CGFloat(loop)
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
    loop
  }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return loop
    }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CustomCollectionViewCell.identifier, for: indexPath) as! CustomCollectionViewCell
    let row = indexPath.row
      cell.titleLBL.text = "\(row) \(indexPath.section)"
      if (row + indexPath.section)  % 2 == 0 {
      //cell.backgroundColor = .red
    } else {
      //cell.backgroundColor = .green
    }
    return cell
  }
}

extension ViewController: UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return .zero
    }
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
     // return CGSize(width: (UIScreen.main.bounds.width) , height: (UIScreen.main.bounds.height))
      //image.size
      return CGSize(width: width, height: height)
  }
  
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
    return 0.0
  }
  
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
    return 0.0
  }
}
