//
//  ContentView.swift
//  PetManager-MVVM
//
//  Created by Wilfred Bradley Tan on 28/10/20.
//

import SwiftUI

struct PetManagerView: View {
    
    @ObservedObject var viewModel: PetManagerViewModel      // 1. Observed ViewModel
    @ObservedObject var keyboardGuardian: KeyboardGuardian
    
    @State private var isShowingAdder = false
    @State private var newName = ""
    @State private var newBreed = ""
    
    var body: some View {
        VStack {
            Text("My Pet Manager")
                .font(.largeTitle)
                .padding(.top)

            TextField("Enter Name", text: $newName)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()

            TextField("Enter Breed", text: $newBreed)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()

            HStack {
                Button(action: {
                    withAnimation {
                        addPet(name: newName, breed: newBreed)
                    }
                    newName = ""
                    newBreed = ""
                    self.hideKeyboard()
                }) {
                    Text("Add")
                }
                .frame(height: 5, alignment: .center)
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
        .gesture(tapGesture)
    }
    
    private func delete(at offsets: IndexSet) {
        viewModel.remove(petAt: offsets)
    }
    
    private func addPet(name: String, breed: String) {
        viewModel.addPet(name, breed)
    }
    
    private var tapGesture: some Gesture {
        let gesture = TapGesture().onEnded {
            hideKeyboard()
        }
        return keyboardGuardian.keyboardIsHidden ? nil : gesture
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        PetManagerView(viewModel: PetManagerViewModel(), keyboardGuardian: KeyboardGuardian())
    }
}

#if canImport(UIKit)
extension View {
    func hideKeyboard() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
#endif
