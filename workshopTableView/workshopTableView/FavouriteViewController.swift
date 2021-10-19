//
//  FavouriteViewController.swift
//  workshopTableView
//
//  Created by wael bannani on 19/10/2021.
//

import UIKit
import CoreData

class FavouriteViewController: UIViewController, UITableViewDataSource
{
    var ischecked=false
    var films = [String]()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchData()

       
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return films.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "mCell")
        let contentView = cell?.viewWithTag(0)
        let label = contentView?.viewWithTag(1) as! UILabel
        let image = contentView?.viewWithTag(2) as! UIImageView
        label.text = films[indexPath.row]
        image.image = UIImage(named: films[indexPath.row])
        return cell!
    }
    
    func fetchData()  {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let persistentContext=appDelegate.persistentContainer
        let managerContext = persistentContext.viewContext
        
        let request = NSFetchRequest<NSManagedObject>(entityName: "Movie")
       
        do {
            let result = try  managerContext.fetch(request)
            for item in result {
                
                films.append(item.value(forKey: "moviename")as! String)
                
               
            }
            
        } catch  {
            
           print("eeror")
        }
        
        
        
    }
    


}
