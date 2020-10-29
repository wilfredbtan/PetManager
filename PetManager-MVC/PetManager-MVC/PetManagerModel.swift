//
//  PetManager.swift
//  PetManager-MVVM
//
//  Created by Wilfred Bradley Tan on 28/10/20.
//

import Foundation

struct PetManagerModel {
    
    private(set) var pets: [Cat]
    
    private let cats = [
        Cat(name: "Mary", breed: "Tabby"),
        Cat(name: "Tom", breed: "Tortoiseshell"),
        Cat(name: "Coby", breed: "Persian"),
        Cat(name: "Nala", breed: "Siamese"),
    ]
    
    init() {
        self.pets = cats
    }
    
    mutating func remove(petAt offsets: Int) {
        pets.remove(at: offsets)
    }
    
    mutating func addCat(_ name: String, _ breed: String) {
        let newPet = Cat(name: name.trimmingCharacters(in: .whitespacesAndNewlines),
                         breed: breed.trimmingCharacters(in: .whitespacesAndNewlines))
        pets.insert(newPet, at: 0)
    }
    
    mutating func satisfyCat(at index: Int) {
        pets[index].satisfyCat()
    }
    
    func getCatResponse(from cat: Cat) -> String {
        return cat.response.sound
    }

}

struct Cat {
    var name: String
    var breed: String
    var status = "unsatisfied"
    var response = CatResponse()
    
    mutating func satisfyCat() {
        status = "meowing"
    }
}

struct CatResponse {
    let sound = "meow"
}






