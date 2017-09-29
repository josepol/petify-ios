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
    var isSelected: Bool
}

class HomeViewController: UIViewController {
    
    var petArray = [cellData]()
    var petArrayFiltered: [cellData] = []
    
    var petImages: [String] = []
    
    var searchIsActive: Bool = false

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var search: UISearchBar!
    @IBOutlet weak var addDeleteSegment: UISegmentedControl!
    @IBOutlet weak var test: UILabel!
    @IBOutlet weak var collectionView: UICollectionView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        search.delegate = self
        collectionView.delegate = self
        collectionView.dataSource = self
        
        petArray = [
            cellData(image: #imageLiteral(resourceName: "shoes1 2"), name: "Muchachino", age: 7, isSelected: false),
            cellData(image: #imageLiteral(resourceName: "shoes1 2"), name: "Padme", age: 6, isSelected: false),
            cellData(image: #imageLiteral(resourceName: "shoes1 2"), name: "Carby", age: 6, isSelected: false),
            cellData(image: #imageLiteral(resourceName: "shoes1 2"), name: "Musha", age: 6, isSelected: false),
            cellData(image: #imageLiteral(resourceName: "shoes1 2"), name: "Bruno", age: 6, isSelected: false)
        ]
        
        petImages = [
            "android", "ios", "angular", "cat", "bootstrap", "shoes1 2"
        ]
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func deleteSelected(_ sender: Any) {
        
        let alert = UIAlertController(title: "Confirmar eliminados", message: "¿Desea eliminar las mascotas seleccionadas?", preferredStyle: UIAlertControllerStyle.alert)
        alert.addAction(UIAlertAction(title: "Aceptar", style: UIAlertActionStyle.default, handler: { (UIAlertAction) in
            var i = 0
            for pet in self.petArray {
                if pet.isSelected {
                    print("pet name: \(pet.name) selected")
                    self.petArray.remove(at: i)
                    
                } else {
                    i += 1
                }
            }
            
            self.tableView.reloadData()
        }))
            
        alert.addAction(UIAlertAction(title: "Cancelar", style: .default, handler: nil))
            
        self.present(alert, animated: true, completion: nil)
        
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
        cell.delegate = self
        
        
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
        test.text = petArray[indexPath.row].name
        
        
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

extension HomeViewController: CustomTableViewCellDelegate {
    
    func didChangeSwitch(cell: TableViewCell) {
        let indexPath = tableView.indexPath(for: cell)
        petArray[(indexPath?.row)!].isSelected = cell.petSelected.isOn
    }

}

extension HomeViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return petImages.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "collection_custom_cell", for: indexPath) as! CustomCollectionViewCell
        
        
        cell.imageView.image = UIImage(named: self.petImages[indexPath.row])
        
        
        return cell
    }
    
}
