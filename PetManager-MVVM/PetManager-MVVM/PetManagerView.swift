//
//  ContentView.swift
//  PetManager-MVVM
//
//  Created by Wilfred Bradley Tan on 28/10/20.
//

import SwiftUI

struct PetManagerView: View {
    
    @ObservedObject var viewModel: PetManagerViewModel
    
    @State private var isShowingAdder = false
    @State private var newName = ""
    @State private var newBreed = ""
    
    var body: some View {
        VStack {
            Text("My Pet Manager")
                .font(.largeTitle)

            TextField("Enter Name", text: $newName)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()

            TextField("Enter Breed", text: $newBreed)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()

            HStack {
                Button(action: {
                    addPet(name: newName, breed: newBreed)
                    newName = ""
                    newBreed = ""
                }) {
                    Text("Add")
                }
                .frame(height: 5, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                .padding()
                .background(Color.blue)
                .foregroundColor(.white)
                .cornerRadius(10.0)
            }

            List {
                ForEach(viewModel.pets, id: \.self) { pet in
                    Text("\(pet.name) the \(pet.breed)")
                }
                .onDelete(perform: delete)
            }
        }
    }
    
    func delete(at offsets: IndexSet) {
        viewModel.remove(petAt: offsets)
    }
    
    func addPet(name: String, breed: String) {
        viewModel.addPet(name, breed)
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        PetManagerView(viewModel: PetManagerViewModel())
    }
}
