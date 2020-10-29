//
//  CatManager.swift
//  PetManager-MVVM
//
//  Created by Wilfred Bradley Tan on 28/10/20.
//

import SwiftUI

class PetManagerViewModel: ObservableObject {
    
    @Published private var model = PetManagerModel()
    
    // MARK: - Access to Model
    
    var pets: [Cat] {
        model.pets
    }
    
    // MARK: - Intents
    
    func remove(petAt offsets: IndexSet) {
        model.remove(petAt: offsets)
    }
    
    func addPet(_ name: String, _ breed: String) {
        model.addCat(name, breed)
    }
    
}
