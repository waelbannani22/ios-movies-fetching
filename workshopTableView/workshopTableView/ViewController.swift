//
//  ViewController.swift
//  workshopTableView
//
//  Created by bannani wael on 10/5/21.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    let films = ["El Camino","Extraction","Project Power","Six Underground","Spenser Confidential","The Irishman"]
    
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
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let movie = films[indexPath.row]
        performSegue(withIdentifier: "mSegue", sender: movie)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "mSegue"){
            let movie = sender as! String
            let destination = segue.destination as! DetailsViewController
            destination.movieTitle = movie 
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
}

