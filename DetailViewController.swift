//
//  DetailViewController.swift
//  BAZON
//
//  Created by Mohamed Traore on 10/17/19.
//  Copyright © 2019 Mohamed Traore. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController, UITableViewDataSource, UITableViewDelegate  {
    
    
    @IBOutlet weak var Category: UILabel!
    @IBOutlet weak var message: UILabel!
   
    @IBOutlet weak var BazinView: UITableView!
    
    
    let iBazin = [UIImage(named:"grey"),UIImage(named:"light_white"),UIImage(named:"green"),UIImage(named:"light_green"), UIImage(named:"pink"),UIImage(named:"brown"),]
    
    let BazinGagnila = [UIImage(named:"grey"),UIImage(named:"light_white"),UIImage(named:"green"),]
    
    let BazinSuperVainqueur = [UIImage(named:"light_green"),UIImage(named:"pink"),UIImage(named:"brown"),]
   
    private var data: [String] = []
    
    var name = ""
    var direction = "choose a design and color"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        Category.text! = name
        message.text! = direction
        BazinView.dataSource = self
        BazinView.delegate = self
        
        let tap = UITapGestureRecognizer(target: self.view, action: #selector(UIView.endEditing))
        
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
        for i in 0...20 {
             data.append("\(i)")
        }
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        var count: Int = 0
        
        if Category.text! == "Gagnila" {
            count = BazinGagnila.count
        }
        else if Category.text! == "Super Vainqueur" {
            count = BazinSuperVainqueur.count
        }
        
        return count
        
    }
    
     func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       // Fetch a cell of the appropriate type.
       let cell = tableView.dequeueReusableCell(withIdentifier: "BazinColor") as! TableViewCell
       
       // Configure the cell’s contents.
      
       // cell.imageView?.image = iBazin[indexPath.row]
      //cell.contentView.backgroundColor = UIColor.red
        if Category.text! == "Gagnila" {
            cell.bazinImage.image = BazinGagnila[indexPath.row]
        }
        else if Category.text! == "Super Vainqueur" {
            cell.bazinImage.image = BazinSuperVainqueur[indexPath.row]
        }
        cell.nombre.text = String(Int(cell.step.value))
        
        
        return cell
    }
    
    var selectedIndex : NSInteger! = -1 //Delecre this global

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row == selectedIndex{
            selectedIndex = -1
        }else{
            selectedIndex = indexPath.row
        }
        
        tableView.beginUpdates();
        tableView.endUpdates();
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == selectedIndex
        {
            return 370
        }else{
            return 74
        }
    }
    
    // MARK: Picker function
    
    
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
}
