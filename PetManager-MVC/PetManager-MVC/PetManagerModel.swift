//
//  PetManager.swift
//  PetManager-MVVM
//
//  Created by Wilfred Bradley Tan on 28/10/20.
//

import Foundation

struct PetManagerModel {
    
    private(set) var pets: [Pet]
    
    init() {
        self.pets = [
            Cat(name: "Mary", breed: "Tabby"),
            Cat(name: "Tom", breed: "Tortoiseshell"),
            Cat(name: "Coby", breed: "Persian"),
            Cat(name: "Nala", breed: "Siamese"),
            Dog(name: "Mika", breed: "Maltese"),
            Dog(name: "Scruffy", breed: "Poodle"),
            Dog(name: "Goldie", breed: "Husky"),
        ]
    }
    
    mutating func remove(petAt offsets: Int) {
        pets.remove(at: offsets)
    }
    
    mutating func addPet(type: PetType,_ name: String, _ breed: String) {
        let petName = name.trimmingCharacters(in: .whitespacesAndNewlines)
        let petBreed = breed.trimmingCharacters(in: .whitespacesAndNewlines)
        
        switch(type) {
        case .cat:
            let cat = Cat(name: petName, breed: petBreed)
            pets.insert(cat, at: 0)
        case .dog:
            let dog = Dog(name: petName, breed: petBreed)
            pets.insert(dog, at: 0)
        }
    }
    
    mutating func satisfyPet(at index: Int) {
        pets[index].satisfy()
    }
    
    func getResponse(from pet: Pet) -> String {
        return pet.response.sound
    }

}

enum PetType: String, CaseIterable {
    case cat = "cat"
    case dog = "dog"
}

protocol PetResponse {
    var sound: String { get }
}

protocol Pet {
    var name: String { get set }
    var breed: String { get set }
    var status: String { get set }
    var response: PetResponse { get set }
    
    mutating func satisfy()
}

struct Cat: Pet {
    var name: String
    var breed: String
    var status: String
    var response: PetResponse
    
    init(name: String, breed: String) {
        self.name = name
        self.breed = breed
        self.status = "unsatisfied"
        self.response = CatResponse()
    }
    
    mutating func satisfy() {
        status = "meowing"
    }
}

struct CatResponse: PetResponse {
    let sound = "meow"
}

struct Dog: Pet {
    var name: String
    var breed: String
    var status: String
    var response: PetResponse
    
    init(name: String, breed: String) {
        self.name = name
        self.breed = breed
        self.status = "unsatisfied"
        self.response = DogResponse()
    }
    
    mutating func satisfy() {
        status = "barking"
    }
}

struct DogResponse: PetResponse {
    let sound = "woof"
}




