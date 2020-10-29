//
//  PetManagerController.swift
//  PetManager-MVC
//
//  Created by Wilfred Bradley Tan on 29/10/20.
//

import UIKit

class PetManagerController: UIViewController {
    
    @IBOutlet var nameTextField: UITextField!
    @IBOutlet var breedTextField: UITextField!
    @IBOutlet weak var petTable: UITableView!
    @IBOutlet weak var addButton: UIButton!
    
    private var model = PetManagerModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(handleTap))
        self.view.addGestureRecognizer(tapGesture)
        
        addButton.layer.cornerRadius = 10.0
        
        petTable.dataSource = self
    }
    
    
    @objc func handleTap(_ sender: UITapGestureRecognizer) {
        resignKeyboard()
    }
    

    @IBAction func addPet(_ sender: Any) {
        guard let name = nameTextField.text, let breed = breedTextField.text else { return }
        
        model.addCat(name, breed)
        
        petTable.reloadData()
        
        resignKeyboard()
    }
    
    func resignKeyboard() {
        nameTextField.resignFirstResponder()
        breedTextField.resignFirstResponder()
    }
    
}

extension PetManagerController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return model.pets.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PET_CELL", for: indexPath)
        let name = model.pets[indexPath.row].name
        let breed = model.pets[indexPath.row].breed
        cell.textLabel?.text = "\(name) the \(breed)"
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            model.remove(petAt: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    
}

