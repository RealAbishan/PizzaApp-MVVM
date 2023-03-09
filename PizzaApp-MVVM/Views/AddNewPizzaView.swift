//
//  AddNewPizzaView.swift
//  PizzaApp-MVVM
//
//  Created by Abishan Parameswaran on 2023-03-09.
//

import SwiftUI

struct AddNewPizzaView: View {
    
    @State private var pizzaName: String = ""
    @State private var ingredient: String = ""
    @State private var imageName: String = ""
    @State private var thumbnailImageName: String = ""
    @State private var pizzaTye: PizzaType = PizzaType.vegetarian
    
    @State private var navigateToReceipe = false
    @Binding var pizzaModel: PizzaModel
    @Environment(\.dismiss) var dismiss
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var dataStore: DataStore
   // @ObservedObject var pizzaviewModel: PizzaViewModel = PizzaViewModel()
    //@Binding var pizzaModel: PizzaModel
    
    var body: some View {
        VStack{
            NavigationView{
                Form{
                    Section(header: Text("Pizza Name").foregroundColor(Color.orange)
                        .font(.system(size: 18)))
                        {
                            TextField("Please Enter Pizza Name", text: $pizzaName)
                                .foregroundColor(Color.orange)
                        }
                    Section(header: Text("Ingredients").foregroundColor(Color.orange)
                        .font(.system(size: 18)))
                        {
                            TextField("Please Enter Ingredients", text: $ingredient)
                                .foregroundColor(Color.orange)
                        }
                    Section(header: Text("Image Name").foregroundColor(Color.orange)
                        .font(.system(size: 18)))
                        {
                            TextField("Please Enter Image Name", text: $imageName)
                                .foregroundColor(Color.orange)
                        }
                    
                    Section(header: Text("Thumbnail Image").foregroundColor(Color.orange)
                        .font(.system(size: 18)))
                        {
                            TextField("Please Enter Thumbnail Image Name", text: $thumbnailImageName)
                                .foregroundColor(Color.orange)
                        }

                    Section(header: Text("Pizza Type").foregroundColor(Color.orange)
                        .font(.system(size: 18))) {
                        Picker(
                            selection: $pizzaTye, label: Text("Type")) {
                            Text("Meat").tag("meat")
                            Text("Vegetarian").tag("vegetarian")
                        }
                        .pickerStyle(SegmentedPickerStyle())
                        .onAppear{
                            UISegmentedControl.appearance().selectedSegmentTintColor = .orange
                            UISegmentedControl.appearance().setTitleTextAttributes([.foregroundColor: UIColor.orange], for: .normal)
                            UISegmentedControl.appearance().setTitleTextAttributes([.foregroundColor: UIColor.white], for: .selected)

                        }
                    }
                    
                    Section(){
                            Button(action: {
                                savePizza()
                                presentationMode.wrappedValue.dismiss()
                            }) {
                                HStack {
                                        Image(systemName: "paperplane")
                                            .font(.title)
                                        Text("Save")
                                            .fontWeight(.semibold)
                                            .font(.title)
                                    }
                                .frame(minWidth: 0, maxWidth: .infinity)
                                .padding()
                                .foregroundColor(.white)
                                .background(LinearGradient(gradient: Gradient(colors: [Color.orange, Color.orange.opacity(0.3)]), startPoint: .leading, endPoint: .trailing))
                                .cornerRadius(40)
                            }
                            .padding(.trailing,1)
                            .padding(.leading,70)
                            .disabled(pizzaName.isEmpty || ingredient.isEmpty || imageName.isEmpty || thumbnailImageName.isEmpty)
                    }
                    .frame(maxWidth: 235)
                }
                .toolbar {
                            ToolbarItem(placement: .navigationBarLeading) {
                                Button {
                                    presentationMode.wrappedValue.dismiss()
                                } label: {
                                    Image(systemName: "chevron.backward")
                                        .foregroundColor(Color.orange)
                                }
                            }
                            ToolbarItem(placement: .navigationBarTrailing) {
//                                NavigationLink(isActive: $navigateToReceipe){
//                                    MainView(dataStore: )
//
//                                }
//                            label:{
//
//                            }
                                Button {
                                    //dataStore.pizzas.append(pizzaModel)
                                    //presentationMode.wrappedValue.dismiss()
                                   // dataStore.addPizzas(pizza: pizzaModel)
                                    //savePizza()

                                } label: {
                                    Text("Dismiss")
                                        .foregroundColor(Color.orange)
                                }
                            }
                        }
            }

            //.padding()
        }
    }
}
//
//struct AddNewPizzaView_Previews: PreviewProvider {
//    static var previews: some View {
//        AddNewPizzaView(pizzaModel: $pizzaModel)
//            .environmentObject(DataStore())
//
//    }
//}

extension AddNewPizzaView{
    private func savePizza(){
        let pizza = PizzaModel(name: pizzaModel.name, ingredients: pizzaModel.ingredients, imageName: pizzaModel.imageName, thumbnailName: pizzaModel.thumbnailName, type: pizzaModel.type)
        dataStore.addPizzas(pizza: pizza)
    }
}
