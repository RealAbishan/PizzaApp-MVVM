//
//  PizzaViewModel.swift
//  PizzaApp-MVVM
//
//  Created by Abishan Parameswaran on 2023-03-09.
//

import Foundation
import SwiftUI

class PizzaViewModel: ObservableObject{
    
    var id : String?
    @Published var name: String = ""
    @Published var ingredients: String = ""
    @Published var imageName: String = ""
    @Published var thumbnailName: String = ""
    @Published var type: String = ""
    
    
    var updating: Bool{
        id != nil
    }
    
    var isDisabled: Bool {
        name.isEmpty
    }
    
    init(){
        
    }
    
    init(_ currentPizza: PizzaModel) {
        self.name = currentPizza.name
        self.ingredients = currentPizza.ingredients
        self.imageName = currentPizza.imageName
        self.thumbnailName = currentPizza.thumbnailName
        self.type = currentPizza.type
        id = currentPizza.id
    }
}

