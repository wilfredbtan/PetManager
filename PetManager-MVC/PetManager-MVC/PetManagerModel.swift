//
//  PetManager.swift
//  PetManager-MVVM
//
//  Created by Wilfred Bradley Tan on 28/10/20.
//

import Foundation

struct PetManagerModel {
    
    private(set) var pets: [Pet]
    
    let cats = [
        Pet(name: "Mary", breed: "Tabby"),
        Pet(name: "Tom", breed: "Tortoiseshell"),
        Pet(name: "Coby", breed: "Persian"),
        Pet(name: "Nala", breed: "Siamese"),
    ]
    
    init() {
        self.pets = cats
    }
    
    mutating func remove(petAt offsets: Int) {
        pets.remove(at: offsets)
    }
    
    mutating func addPet(_ name: String, _ breed: String) {
        let newPet = Pet(name: name.trimmingCharacters(in: .whitespacesAndNewlines),
                         breed: breed.trimmingCharacters(in: .whitespacesAndNewlines))
        pets.insert(newPet, at: 0)
    }

}

struct Pet {
    var name: String
    var breed: String
}





