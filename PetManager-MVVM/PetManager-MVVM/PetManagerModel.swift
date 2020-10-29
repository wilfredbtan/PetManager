//
//  PetManager.swift
//  PetManager-MVVM
//
//  Created by Wilfred Bradley Tan on 28/10/20.
//

import Foundation

struct PetManagerModel {
    
    private(set) var pets: [Cat]
    
    // UUID is a little overkill but it's just for demo purposes
    private let cats = [
        Cat(id: UUID(), name: "Mary", breed: "Tabby"),
        Cat(id: UUID(), name: "Tom", breed: "Tortoiseshell"),
        Cat(id: UUID(), name: "Coby", breed: "Persian"),
        Cat(id: UUID(), name: "Nala", breed: "Siamese"),
    ]
    
    init() {
        self.pets = cats
    }
    
    mutating func remove(petAt offsets: IndexSet) {
        pets.remove(atOffsets: offsets)
    }
    
    mutating func addCat(_ name: String, _ breed: String) {
        let newPet = Cat(id: UUID(),
                         name: name.trimmingCharacters(in: .whitespacesAndNewlines),
                         breed: breed.trimmingCharacters(in: .whitespacesAndNewlines))
        pets.insert(newPet, at: 0)
    }

}

struct Cat: Identifiable, Hashable {
    var id: UUID
    var name: String
    var breed: String
}





