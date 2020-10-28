//
//  CatManager.swift
//  PetManager-MVVM
//
//  Created by Wilfred Bradley Tan on 28/10/20.
//

import SwiftUI

class PetManagerViewModel: ObservableObject {
    
    @Published private var model: PetManagerModel = PetManagerViewModel.createPetManager()
    
    private static func createPetManager() -> PetManagerModel {
        return PetManagerModel(petType: .cat)
    }
    
    // MARK: - Access to Model
    
    var pets: [PetManagerModel.Pet] {
        model.pets
    }
    
    // MARK: - Intents
    
    func remove(petAt offsets: IndexSet) {
        model.remove(petAt: offsets)
    }
    
    func addPet(_ name: String, _ breed: String) {
        model.addPet(name, breed)
    }
    
}
