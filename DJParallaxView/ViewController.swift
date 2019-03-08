//
//  ViewController.swift
//  DJParallaxView
//
//  Created by Dheeraj Sontakke on 07/03/19.
//  Copyright © 2019 Dheeraj Sontakke. All rights reserved.
//

import UIKit

class ImageCellClass: UICollectionViewCell {

@IBOutlet weak var picsImageView: UIImageView!
}

class SwipeCellClass: UICollectionViewCell {
    
}

//class SwipeTableViewCell: UITableViewCell , UICollectionViewDataSource, UICollectionViewDelegate {
//    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        return 4
//    }
//    
//    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//        let swipeCell = collectionView.dequeueReusableCell(withReuseIdentifier: "swipeCells", for: indexPath as IndexPath) as! SwipeCellClass
//        return swipeCell
//    }
//    
//    @IBOutlet weak var swipeCollView: UICollectionView!
//}


class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, UICollectionViewDelegate, UICollectionViewDataSource {
    
    @IBOutlet weak var imageCollectionView: UICollectionView!
    @IBOutlet var tableView: UITableView!
    
    @IBOutlet var headerView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.configureTableView()
        self.setImageHeader()
       
       
    }
    
    func configureTableView(){
        tableView.dataSource = self
        tableView.delegate = self
        tableView.estimatedSectionHeaderHeight = 40.0
        tableView.contentInsetAdjustmentBehavior = .automatic
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 200
    }
    
    func configureSegmentedControl(titleOne: String, titleTwo: String, titleThree: String) -> UIView{
        let v = UIView()
        v.backgroundColor = UIColor.white
        let segmentedControl = UISegmentedControl(frame: CGRect(x: 10, y: 5, width: tableView.frame.width - 20, height: 30))
        segmentedControl.insertSegment(withTitle: titleOne, at: 0, animated: false)
        segmentedControl.insertSegment(withTitle: titleTwo, at: 1, animated: false)
        segmentedControl.insertSegment(withTitle: titleThree, at: 2, animated: false)
        v.addSubview(segmentedControl)
        return v
    }
    
    func setImageHeader(){
         tableView.tableHeaderView = headerView
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //MARK: UITableViewDelegate
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        return self.configureSegmentedControl(titleOne: "Summary", titleTwo: "Rules", titleThree: "Review")
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    //MARK: UITableViewDataSource
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CellID") as! SwipeCell
        //cell.textLabel?.text = "\(indexPath.row)"
        imageCollectionView.delegate = self
        imageCollectionView.dataSource = self
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
            return 10
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
            let cell1 = collectionView.dequeueReusableCell(withReuseIdentifier: "ImageCell", for: indexPath as IndexPath) as! ImageCellClass
            return cell1
        }
    
}

