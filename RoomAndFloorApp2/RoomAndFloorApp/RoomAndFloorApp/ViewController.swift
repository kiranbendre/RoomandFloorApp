//
//  ViewController.swift
//  RoomAndFloorApp
//
//  Created by developer on 12/16/22.
//

import UIKit

class ViewController: UIViewController,UICollectionViewDelegate,UICollectionViewDataSource ,UICollectionViewDelegateFlowLayout{
    
    var collectionViewOne : UICollectionView?
    var collectionViewTwo : UICollectionView?
    
    var floorselectedIndex = 0
    var roomselectedIndex  = 0
    
    var wholefloorArray = ["Wholefloor","Floor1","Floor2"]
    var roomArray = ["Room1","Room2","Room3"]
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
       
        SetUPCV1()
        SetUPCV2()
        
        
}
    func SetUPCV1(){
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: 150, height: 150)
        layout.scrollDirection = .horizontal
        //MARK:- First collectionview
        collectionViewOne = UICollectionView(frame: CGRect(x: 0, y: 80, width: 400, height: 200), collectionViewLayout: layout)
        collectionViewOne?.dataSource = self
        collectionViewOne?.delegate = self
        collectionViewOne?.register(CollectionViewCell.self, forCellWithReuseIdentifier: "FloorCell")
        //collectionViewOne?.backgroundColor = UIColor.yellow
        collectionViewOne?.backgroundColor = UIColor(red: 33.0/255, green: 40.0/255, blue: 64.0/255, alpha: 1.0)
        self.view.addSubview(collectionViewOne!)
    }
    func SetUPCV2(){
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: 150, height: 1500)
        layout.scrollDirection = .horizontal
        //MARK:- Second collectionview
        collectionViewTwo = UICollectionView(frame: CGRect(x: 0, y: 400, width: 400, height: 200), collectionViewLayout: layout)
        collectionViewTwo?.dataSource = self
        collectionViewTwo?.delegate = self
        collectionViewTwo?.register(RoomcollectionViewCell.self, forCellWithReuseIdentifier: "RoomCell")
        //collectionViewTwo?.backgroundColor = UIColor.yellow
        collectionViewTwo?.backgroundColor = UIColor(red: 33.0/255, green: 40.0/255, blue: 64.0/255, alpha: 1.0)
        self.view.addSubview(collectionViewTwo!)
    }
    
    //MARK:- Protocol datasource and delegate method
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        if collectionView == self.collectionViewOne {
                return wholefloorArray.count
           } else {
                return roomArray.count + 1
                }
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
       
        if collectionView == self.collectionViewOne {
            let myCell = collectionView.dequeueReusableCell(withReuseIdentifier: "FloorCell", for: indexPath as IndexPath)as! CollectionViewCell
            myCell.floorLabel.text = wholefloorArray[indexPath.row]
            myCell.backgroundColor = UIColor(red: 63.0/255, green: 70.0/255, blue: 100.0/255, alpha: 1.0)
            
            //for round cell
            //myCell.layer.masksToBounds = false
            myCell.layer.cornerRadius = myCell.frame.height/2
            //myCell.clipsToBounds = true
            return myCell
       } else {
            let myCell2 = collectionView.dequeueReusableCell(withReuseIdentifier: "RoomCell", for: indexPath as IndexPath)as! RoomcollectionViewCell
           myCell2.backgroundColor = UIColor(red: 63.0/255, green: 70.0/255, blue: 100.0/255, alpha: 1.0)
           myCell2.layer.cornerRadius = myCell2.frame.height/2
            //for select on cell and show room
       if indexPath.row == 0 {
               myCell2.roomLabel.text = wholefloorArray[floorselectedIndex]
          } else {
              myCell2.roomLabel.text = roomArray[indexPath.row - 1]
           }
                return myCell2
           }
       
        }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    
        return CGSize(width: 150, height: 150)
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if collectionView == collectionViewOne{
             floorselectedIndex = indexPath.row
            collectionViewTwo?.reloadData()
        }else{
            roomselectedIndex = indexPath.row
            collectionViewTwo?.reloadData()
        }
    }
}
class CollectionViewCell: UICollectionViewCell{
    let cellId = "FloorCell"
    
    var floorLabel = UILabel()
    
    //var cornerRadius: CGFloat = 5.0
    
   override init(frame: CGRect) {
        super.init(frame: frame)
        
//        contentView.layer.cornerRadius = cornerRadius
//        contentView.layer.masksToBounds = true
//        layer.cornerRadius = cornerRadius
//        layer.masksToBounds = false
        
        floorLabel.textColor = UIColor.white
        floorLabel.text = "Label"
        floorLabel.textAlignment = .center
        addSubview(floorLabel)
        floorLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint(item: floorLabel, attribute:.top, relatedBy:.equal, toItem: self, attribute:.top, multiplier: 1, constant: 50).isActive = true
        NSLayoutConstraint(item: floorLabel, attribute:.leading, relatedBy:.equal, toItem: self, attribute:.leading, multiplier: 1, constant: 10).isActive = true
        NSLayoutConstraint(item: floorLabel, attribute:.trailing, relatedBy:.equal, toItem: self, attribute:.trailing, multiplier: 1, constant: -10).isActive = true
        }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
class RoomcollectionViewCell: UICollectionViewCell{
    let cellId2 = "RoomCell"

    var roomLabel = UILabel()
    //var cornerRadius: CGFloat = 5.0
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
//        contentView.layer.cornerRadius = cornerRadius
//        contentView.layer.masksToBounds = true
//        layer.cornerRadius = cornerRadius
//        layer.masksToBounds = false
        
        
        roomLabel.textColor = UIColor.white
        roomLabel.text = "Label2"
        roomLabel.textAlignment = .center
        addSubview(roomLabel)
        roomLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint(item: roomLabel, attribute:.top, relatedBy:.equal, toItem: self, attribute:.top, multiplier: 1, constant: 50).isActive = true
        NSLayoutConstraint(item: roomLabel, attribute:.leading, relatedBy:.equal, toItem: self, attribute:.leading, multiplier: 1, constant: 10).isActive = true
        NSLayoutConstraint(item: roomLabel, attribute:.trailing, relatedBy:.equal, toItem: self, attribute:.trailing, multiplier: 1, constant: -10).isActive = true
       // NSLayoutConstraint(item: roomLabel, attribute:.height, relatedBy:.equal, toItem: self, attribute:.height, multiplier: 1, constant: 50).isActive = true
        }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
