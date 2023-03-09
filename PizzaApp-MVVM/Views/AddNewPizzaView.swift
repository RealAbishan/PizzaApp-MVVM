//
//  AddNewPizzaView.swift
//  PizzaApp-MVVM
//
//  Created by Abishan Parameswaran on 2023-03-09.
//

import SwiftUI

struct AddNewPizzaView: View {

    @Environment(\.dismiss) var dismiss
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var dataStore: DataStore
    @ObservedObject var pizzaviewModel: PizzaViewModel = PizzaViewModel()
    //@Binding var pizzaModel: PizzaModel
    
    var body: some View {
        VStack{
            NavigationView{
                Form{
                    Section(header: Text("Pizza Name").foregroundColor(Color.orange)
                        .font(.system(size: 18)))
                        {
                            TextField("Please Enter Pizza Name", text: $pizzaviewModel.name)
                                .foregroundColor(Color.orange)
                        }
                    Section(header: Text("Ingredients").foregroundColor(Color.orange)
                        .font(.system(size: 18)))
                        {
                            TextField("Please Enter Ingredients", text: $pizzaviewModel.name)
                                .foregroundColor(Color.orange)
                        }
                    Section(header: Text("Image Name").foregroundColor(Color.orange)
                        .font(.system(size: 18)))
                        {
                            TextField("Please Enter Image Name", text: $pizzaviewModel.name)
                                .foregroundColor(Color.orange)
                        }
                    
                    Section(header: Text("Thumbnail Image").foregroundColor(Color.orange)
                        .font(.system(size: 18)))
                        {
                            TextField("Please Enter Thumbnail Image Name", text: $pizzaviewModel.name)
                                .foregroundColor(Color.orange)
                        }

                    Section(header: Text("Pizza Type").foregroundColor(Color.orange)
                        .font(.system(size: 18))) {
                        Picker(
                            selection: $pizzaviewModel.type, label: Text("Type")) {
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
                //                            dataStore.pizzas.append(pizzaviewModel)
                //                            presentationMode.wrappedValue.dismiss()
                //                            dataStore.addPizzas(pizzaviewModel)
                // save each time new one is added as alternative to didSet in class
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
                            .disabled(pizzaviewModel.name.isEmpty || pizzaviewModel.ingredients.isEmpty || pizzaviewModel.imageName.isEmpty || pizzaviewModel.thumbnailName.isEmpty)
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
                                Button {
                                   // isSheetShowing.toggle()
                                } label: {
                                    Text("Save")
                                        .foregroundColor(Color.orange)
                                }
                            }
                        }
            }

            //.padding()
        }
    }
}

struct AddNewPizzaView_Previews: PreviewProvider {
    static var previews: some View {
        AddNewPizzaView()
    }
}

