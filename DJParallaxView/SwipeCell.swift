//
//  SwipeCell.swift
//  DJParallaxView
//
//  Created by Dheeraj Sontakke on 07/03/19.
//  Copyright © 2019 Dheeraj Sontakke. All rights reserved.
//

import UIKit

class SwipeCell: UITableViewCell, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{

    
    
    @IBOutlet weak var swipeCollView: UICollectionView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.swipeCollView.delegate = self
        self.swipeCollView.dataSource = self
        // Initialization code
    }
    func segmentTapped() {
        print("Tapped")
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
                return 4
            }
        
            func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
                let swipeCell = collectionView.dequeueReusableCell(withReuseIdentifier: "swipeCells", for: indexPath as IndexPath) as! SwipeCellClass
                return swipeCell
            }
    
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//        return CGSize(width: 100, height: 100)
//    }

}
