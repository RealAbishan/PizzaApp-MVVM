//
//  DataStore.swift
//  PizzaApp-MVVM
//
//  Created by Abishan Parameswaran on 2023-03-09.
//

import Foundation
import SwiftUI

class DataStore: ObservableObject{
    
    @Published var pizzas: [PizzaModel] = []

    init() {
        loadPizzas()
    }
    
    func addPizzas(_ pizza: PizzaModel){
        pizzas.append(pizza)
    }
    
    func deletePizzas(at index: IndexSet){
        pizzas.remove(atOffsets: index)
    }
    
    
    func loadPizzas(){
        pizzas = PizzaModel.samplePizzaModel
    }
    
    func savePizzas(){
        print("Successfully Saved the Pizzas to the File System")
    }
//    func addPizzas(){
//        let pizzaDummy = FruitModel(name: "Watermelon", price: 120)
//        fruits.append(fruitSix)
//    }
    
}
