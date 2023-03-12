//
//  ViewController.swift
//  SimpsonBook
//
//  Created by Serdar Altındaş on 10.03.2023.
//

import UIKit

class ViewController: UIViewController , UITableViewDelegate , UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    
    var MySimpsons = [Simpson]()
    var chosenSimpson : Simpson?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        //SIMPSON
        let homer = Simpson(name: "Homer Simpson", job: "Nuclear Safty", image: UIImage(named: "homer")!, age: "50")
        let marge = Simpson(name: "Marge Simpson", job: "House Wife", image: UIImage(named: "marge")!, age: "45")
        let bart = Simpson(name: "Bart Simpson", job: "Student", image: UIImage(named: "bart")!, age: "10")
        let lisa = Simpson(name: "Lisa Simpson", job: "Student", image: UIImage(named: "lisa")!, age: "5")
        let maggie = Simpson(name: "Maggie Simpson", job: "Student", image: UIImage(named: "maggie")!, age: "2")

        
        MySimpsons.append(homer)
        MySimpsons.append(marge)
        MySimpsons.append(bart)
        MySimpsons.append(lisa)
        MySimpsons.append(maggie)
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return MySimpsons.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        var content = cell.defaultContentConfiguration()
        content.text = MySimpsons[indexPath.row].name
        content.secondaryText = MySimpsons[indexPath.row].job
        cell.contentConfiguration = content
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        chosenSimpson = MySimpsons[indexPath.row]
        self.performSegue(withIdentifier: "toDetailsVC", sender: nil )
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toDetailsVC"{
            let destinationVC = segue.destination as! detailsVC
            destinationVC.selectedSimpson = chosenSimpson
        }
    }
}

