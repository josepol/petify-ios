//
//  HomeViewController.swift
//  petify
//
//  Created by Jose Pol Sastre on 22/9/17.
//  Copyright © 2017 Jose Pol Sastre. All rights reserved.
//

import UIKit

struct cellData {
    let image: UIImage
    let name: String
    let age: Int
}

class HomeViewController: UIViewController {
    
    var petArray = [cellData]()
    var petArrayFiltered: [cellData] = []
    
    var searchIsActive: Bool = false

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var search: UISearchBar!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        search.delegate = self
        
        petArray = [
            cellData(image: #imageLiteral(resourceName: "shoes1 2"), name: "Muchachino", age: 7),
            cellData(image: #imageLiteral(resourceName: "shoes1 2"), name: "Padme", age: 6),
            cellData(image: #imageLiteral(resourceName: "shoes1 2"), name: "Carby", age: 6),
            cellData(image: #imageLiteral(resourceName: "shoes1 2"), name: "Musha", age: 6),
            cellData(image: #imageLiteral(resourceName: "shoes1 2"), name: "Bruno", age: 6)
        ]
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    

}

extension HomeViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if searchIsActive {
            return petArrayFiltered.count
        } else {
            return petArray.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        tableView.separatorStyle = .none
        
        let cell = Bundle.main.loadNibNamed("TableViewCell", owner: self, options: nil)?.first as! TableViewCell
        
        
        if searchIsActive {
            cell.petImageView.image = petArrayFiltered[indexPath.row].image
            cell.nameLabel.text = petArrayFiltered[indexPath.row].name
            cell.ageLabel.text = "\(petArrayFiltered[indexPath.row].age)"
        } else {
            cell.petImageView.image = petArray[indexPath.row].image
            cell.nameLabel.text = petArray[indexPath.row].name
            cell.ageLabel.text = "\(petArray[indexPath.row].age)"
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 107
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell = tableView.cellForRow(at: indexPath) as! TableViewCell
        cell.selectionStyle = .none
    }
    
}

extension HomeViewController: UISearchBarDelegate {
    
    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
        searchIsActive = true
    }
    
    func searchBarTextDidEndEditing(_ searchBar: UISearchBar) {
        searchIsActive = false
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchIsActive = false
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchIsActive = false
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        petArrayFiltered = petArray.filter { (text) -> Bool in
            let tmp: NSString = text.name as NSString
            let range = tmp.range(of: searchText, options: .caseInsensitive)
            return range.location != NSNotFound
        }

        if(petArrayFiltered.count == 0){
            searchIsActive = false;
        } else {
            searchIsActive = true;
        }
        
        self.tableView.reloadData()
    }
    
}
