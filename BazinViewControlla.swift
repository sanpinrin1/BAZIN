//
//  BazinViewControlla.swift
//  BAZON
//
//  Created by Mohamed Traore on 10/15/19.
//  Copyright © 2019 Mohamed Traore. All rights reserved.
//

import UIKit

private let reuseIdentifier = "BazinCell"

let imageArray = [UIImage(named:"candice"),UIImage(named:"datboi"),UIImage(named:"prince"),UIImage(named:"warriors"), ]

let nameArray = ["Super Vainqueur", "Gagnila","Super Vainqueur","Super Vainqueur"]


private let sectionInsets = UIEdgeInsets(top: 5.0,
left: 5.0,
bottom: 5.0,
right: 5.0)

private let itemsPerRow: CGFloat = 2



class BazinViewControlla: UICollectionViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
       
        
        // Register cell classes
        //self.collectionView!.register(BazonPhotoCell.self, forCellWithReuseIdentifier: "BazonPhotoCell")
        
        // Do any additional setup after loading the view.
        
    }

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return nameArray.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! BazonPhotoCell
    
        // Configure the cell
        cell.backgroundColor = .black
        //cell.configure(with: bazin[indexPath.row])
        //cell.imahe.image = imageArray[indexPath.row]
        cell.label.text! = nameArray[indexPath.row]
        
        return cell
    }

    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let mainStoryboard:UIStoryboard = UIStoryboard (name: "Main", bundle: nil)
        let desVC = mainStoryboard.instantiateViewController(withIdentifier: "DetailViewController") as! DetailViewController
        desVC.name = nameArray[indexPath.row]
        self.navigationController?.pushViewController(desVC, animated: true)
    }
    
    
    // MARK: UICollectionViewDelegate

    /*
    // Uncomment this method to  n  if the specified item should be highlighted during tracking
    override func collectionView(_ collectionView: UICollectionView, shouldHighlightItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment this method to specify if the specified item should be selected
    override func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */
    /*
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath)
    {
        let controller = self.storyboard?.instantiateViewController(withIdentifier: "TableViewController") as! TableViewController
        self.navigationController?.pushViewController(controller, animated: true)
    }
    */
    
    
    /*
    // Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
    override func collectionView(_ collectionView: UICollectionView, shouldShowMenuForItemAt indexPath: IndexPath) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, canPerformAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, performAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) {
    
    }
    */
}

// MARK: - Collection View Flow Layout Delegate
extension BazinViewControlla : UICollectionViewDelegateFlowLayout {
  //1
  func collectionView(_ collectionView: UICollectionView,
                      layout collectionViewLayout: UICollectionViewLayout,
                      sizeForItemAt indexPath: IndexPath) -> CGSize {
    //2
    let paddingSpace = sectionInsets.left
    let availableWidth = view.frame.width - paddingSpace
    let widthPerItem = (availableWidth - 15 ) / (itemsPerRow + 0)
    
    return CGSize(width: widthPerItem, height: (widthPerItem * 3/2) )
  }
  
  //3
  func collectionView(_ collectionView: UICollectionView,
                      layout collectionViewLayout: UICollectionViewLayout,
                      insetForSectionAt section: Int) -> UIEdgeInsets {
    return sectionInsets
  }
  
  // 4
  func collectionView(_ collectionView: UICollectionView,
                      layout collectionViewLayout: UICollectionViewLayout,
                      minimumLineSpacingForSectionAt section: Int) -> CGFloat {
    return sectionInsets.left
  }
}

// MARK: - Text Field Delegate
extension BazinViewControlla : UITextFieldDelegate {
  func textFieldShouldReturn(_ textField: UITextField) -> Bool {
    
    textField.text = nil
    textField.resignFirstResponder()
    return true
  }
}

