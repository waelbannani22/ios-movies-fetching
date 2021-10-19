//
//  DetailsViewController.swift
//  workshopTableView
//
//  Created by bannani wael on 10/5/21.
//

import UIKit
import CoreData

class DetailsViewController: UIViewController {
    
    let managerContext = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext//core data for big data

    var favouriteMovies = [Movie]()
    var movieTitle:String?
    var isChecked = false
    @IBOutlet weak var movieImage: UIImageView!
    @IBOutlet weak var movieLabel: UILabel!
    @IBOutlet weak var btnAddFavourite: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        movieLabel.text = movieTitle
        movieImage.image = UIImage(named: movieTitle!)
        
        if self.verif(title: movieTitle!) == 1 {
            btnAddFavourite.isHidden = true
        }
    }

  
    @IBAction func addFavourite(_ sender: Any) {
        
      
        
        let alert = UIAlertController(title: "\(movieTitle!)", message: "Add to you're favorite movies", preferredStyle: .alert)
        //2
        let cancel = UIAlertAction(title: "Cancel", style: .cancel)
        let action = UIAlertAction(title: "OK", style: .default) { UIAlertAction in
            let newItem = Movie(context: self.managerContext)
            newItem.moviename = self.movieTitle
           
            self.saveItems()
            self.navigationController?.popViewController(animated: true)
        }
        //3
        alert.addAction(action)
        alert.addAction(cancel)
        //4
        self.present(alert, animated: true, completion: nil)
    }
    //methods
    //Mark - save Items
    func saveItems() {
        if managerContext.hasChanges {
            do {
                try self.managerContext.save()
            } catch {
                let nserror = error as NSError
                print("Unresolved error, \(nserror), \(nserror.userInfo)")
            }
        }
    }
    //MARK: -Verif existant of the Categories
    func verif(title:String) -> Int {
        let predicate = NSPredicate(format: "moviename == %@", title)//search
        let request: NSFetchRequest<Movie> = Movie.fetchRequest()
        request.predicate = predicate
        do {
            let array = try self.managerContext.fetch(request)
            return array.count
        } catch {
            print("Error fetching data from context \(error)")
            return 2
        }
    }
}
