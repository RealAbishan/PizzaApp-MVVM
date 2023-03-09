//
//  MainView.swift
//  PizzaApp-MVVM
//
//  Created by Abishan Parameswaran on 2023-03-09.
//

import SwiftUI

struct MainView: View {
    @State private var foodType = 0
    @State private var isSheetShowing:Bool = false
    var body: some View {
        VStack{
            NavigationView{
                NavigationStack{
                    VStack{
                        Picker("", selection: $foodType){
                            Text("All").tag(0)
                            Text("Meat").tag(1)
                            Text("Veggie").tag(2)
                        }
                        .pickerStyle(SegmentedPickerStyle())
                        .padding()
                        .onAppear{
                            UISegmentedControl.appearance().selectedSegmentTintColor = .orange
                            UISegmentedControl.appearance().setTitleTextAttributes([.foregroundColor: UIColor.orange], for: .normal)
                            UISegmentedControl.appearance().setTitleTextAttributes([.foregroundColor: UIColor.white], for: .selected)

                        }
                    }
//                    .navigationTitle("Pizza App")
                    .navigationBarTitleDisplayMode(.inline)
                    

                    .toolbar {
                                ToolbarItem(placement: .navigationBarLeading) {
                                    Button {
                                        //isSheetShowing.toggle()
                                    } label: {
                                        Image(systemName: "list.dash")
                                            .foregroundColor(Color.orange)
                                    }
                                }
                        
                        ToolbarItem(placement: .navigationBarLeading) {
                            Text("Pizza App")
                                .font(.system(size: 24))
                                .foregroundColor(Color.orange)
                                .bold()
                        }
                        ToolbarItem(placement: .navigationBarTrailing) {
                            Button {
                               // isSheetShowing.toggle()
                            } label: {
                                Image(systemName: "magnifyingglass")
                                    .foregroundColor(Color.orange)
                            }
                        }
                                ToolbarItem(placement: .navigationBarTrailing) {
                                    Button {
                                        isSheetShowing.toggle()
                                    } label: {
                                        Image(systemName: "plus")
                                            .foregroundColor(Color.orange)
                                    }
                                }
                            }
                    .sheet(isPresented: $isSheetShowing){
                        AddNewPizzaView()
                        }
                    
                    VStack{
                        switch foodType{
                        case 1:
                            MeatPage()

                        case 2:
                            VeggiePage()

                        default:
                            AllPage()
                        }
                    }
                    //.background(Color.red)
                }
            }
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}


struct AllPage: View{
    @State var foodType = 0
   // @ObservedObject var pizzaViewModel: PizzaViewModel = PizzaViewModel()
    @ObservedObject var dataStore: DataStore = DataStore()


    var body: some View{
        NavigationView{
            VStack {
                List() {
                    ForEach(dataStore.pizzas){ pizza in
                        HStack(alignment: .center){
                            Image("\(pizza.imageName)")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 150)
                                .frame(height: 150)
                            
                            VStack(alignment: .leading){
                                Text("\(pizza.name)")
                                    .font(.system(size: 18))
                                    .bold()
                                    .foregroundColor(Constants.newPrimaryColor)
                                    .multilineTextAlignment(.leading)
                                
                                Text("\(pizza.ingredients)")
                                    .multilineTextAlignment(.leading)
                            }
                            .frame(width: 150)
                            
                            
                            
                        }
                        
                        
                        
                        

                    }
                }
                .listStyle(InsetGroupedListStyle())
            }
        }
        .navigationViewStyle(.stack)
    }
}

struct MeatPage: View{
    @State var foodType = 0
    @ObservedObject var dataStore: DataStore = DataStore()
    init() {
        UITableView.appearance().backgroundColor = .red
        
    }
    var body: some View{
        NavigationView{
            ZStack {
                List() {
                    ForEach(dataStore.pizzas){ pizza in

      //                  Text("\(pizza.name)")
                        if(pizza.type == PizzaType.meat.rawValue){
                            HStack(alignment: .center){
                                Image("\(pizza.imageName)")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 150)
                                    .frame(height: 150)
                                
                                VStack(alignment: .leading){
                                    Text("\(pizza.name)")
                                        .font(.system(size: 18))
                                        .bold()
                                        .foregroundColor(Constants.newPrimaryColor)
                                        .multilineTextAlignment(.leading)
                                    
                                    Text("\(pizza.ingredients)")
                                        .multilineTextAlignment(.leading)
                                }
                                .frame(width: 150)
                                
                                
                                
                            }
                        }


                    }
                }
                .listStyle(InsetGroupedListStyle())
            }
        }
        .navigationViewStyle(.stack)
    }
}

struct VeggiePage: View{
    @State var foodType = 0
    @ObservedObject var dataStore: DataStore = DataStore()


    var body: some View{
        NavigationView{
            ZStack {
                List() {
                    ForEach(dataStore.pizzas){ pizza in

      //                  Text("\(pizza.name)")
                        if(pizza.type == PizzaType.vegetarian.rawValue){
                            HStack(alignment: .center){
                                Image("\(pizza.imageName)")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 150)
                                    .frame(height: 150)
                                
                                VStack(alignment: .leading){
                                    Text("\(pizza.name)")
                                        .font(.system(size: 18))
                                        .bold()
                                        .foregroundColor(Constants.newPrimaryColor)
                                        .multilineTextAlignment(.leading)
                                    
                                    Text("\(pizza.ingredients)")
                                        .multilineTextAlignment(.leading)
                                }
                                .frame(width: 150)
                                
                                
                                
                            }
                        }


                    }
                }
                .listStyle(InsetGroupedListStyle())
            }
        }
        .navigationViewStyle(.stack)
    }
}
