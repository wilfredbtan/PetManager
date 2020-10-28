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
        Pet(id: 1, name: "Mary", breed: "Tabby"),
        Pet(id: 2, name: "Tom", breed: "Tortoiseshell"),
        Pet(id: 3, name: "Coby", breed: "Persian"),
        Pet(id: 4, name: "Nala", breed: "Siamese"),
    ]
    
    init(petType: PetType) {
        switch (petType) {
        case .cat:
            pets = cats
        }
    }
    
    mutating func remove(petAt offsets: IndexSet) {
        pets.remove(atOffsets: offsets)
    }
    
    mutating func addPet(_ name: String, _ breed: String) {
        let newPet = Pet(id: pets.count, name: name, breed: breed)
        pets.append(newPet)
    }

    enum PetType {
        case cat
    }
    
    struct Pet: Identifiable, Hashable {
        var id: Int
        var name: String
        var breed: String
    }
    
}




