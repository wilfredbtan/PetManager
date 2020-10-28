//
//  PetManager.swift
//  PetManager-MVVM
//
//  Created by Wilfred Bradley Tan on 28/10/20.
//

import Foundation

struct PetManagerModel {
    
    private(set) var pets: [Pet]
    
    // I know UUID is a little overkill but it's just for demo purposes
    let cats = [
        Pet(id: UUID(), name: "Mary", breed: "Tabby"),
        Pet(id: UUID(), name: "Tom", breed: "Tortoiseshell"),
        Pet(id: UUID(), name: "Coby", breed: "Persian"),
        Pet(id: UUID(), name: "Nala", breed: "Siamese"),
    ]
    
    init() {
        self.pets = cats
    }
    
    mutating func remove(petAt offsets: IndexSet) {
        pets.remove(atOffsets: offsets)
    }
    
    mutating func addPet(_ name: String, _ breed: String) {
        let newPet = Pet(id: UUID(),
                         name: name.trimmingCharacters(in: .whitespacesAndNewlines),
                         breed: breed.trimmingCharacters(in: .whitespacesAndNewlines))
        pets.insert(newPet, at: 0)
    }

}

struct Pet: Identifiable, Hashable {
    var id: UUID
    var name: String
    var breed: String
}





