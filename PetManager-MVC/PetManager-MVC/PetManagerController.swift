//
//  PetManagerController.swift
//  PetManager-MVC
//
//  Created by Wilfred Bradley Tan on 29/10/20.
//

import UIKit

class PetManagerController: UIViewController {
    
    @IBOutlet var formContainer: UIView!
    @IBOutlet var nameTextField: UITextField!
    @IBOutlet var breedTextField: UITextField!
    @IBOutlet weak var petTable: UITableView!
    @IBOutlet weak var addButton: UIButton!
    
    private var model = PetManagerModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(handleTap))
        tapGesture.delegate = self
        formContainer.addGestureRecognizer(tapGesture)
        
        addButton.layer.cornerRadius = 10.0
        
        petTable.dataSource = self
        petTable.delegate = self
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
    
    // MARK: - DataSource
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return model.pets.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TABLE_CELL", for: indexPath) as! TableCell
        let name = model.pets[indexPath.row].name
        let breed = model.pets[indexPath.row].breed
        let status = model.pets[indexPath.row].status
        
        cell.textLabel?.text = "\(name) the \(breed)"
        cell.statusLabel.text = status
        cell.statusContainer.layer.masksToBounds = true
        cell.statusContainer.layer.cornerRadius = 8
        cell.statusContainer.backgroundColor = status == "unsatisfied" ? .lightGray : .systemBlue

        return cell
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            model.remove(petAt: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    // MARK: - Delegate Methods
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cat = model.pets[indexPath.row]
        let name = cat.name
        let response = model.getCatResponse(from: cat)

        let satisfyAlert = UIAlertController(title: "\(name)", message: response, preferredStyle: .alert)
        satisfyAlert.addAction(UIAlertAction(title: "Aww", style: .cancel, handler: nil))
        self.present(satisfyAlert, animated: true)
    
        self.model.satisfyCat(at: indexPath.row)
        
        tableView.reloadData()
        tableView.deselectRow(at: indexPath, animated: false)
    }
    
}

extension PetManagerController: UIGestureRecognizerDelegate {
    
    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldRecognizeSimultaneouslyWith otherGestureRecognizer: UIGestureRecognizer) -> Bool {
        return true
    }
    
}
