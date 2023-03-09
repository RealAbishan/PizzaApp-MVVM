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
    @EnvironmentObject var dataStore : DataStore
    @State private var newPizza = PizzaModel(name: "", ingredients: "", imageName: "", thumbnailName: "", type: "")
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
                        AddNewPizzaView(pizzaModel: $newPizza)
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
            .environmentObject(DataStore())
    }
}


struct AllPage: View{
    @State var foodType = 0
   // @ObservedObject var pizzaViewModel: PizzaViewModel = PizzaViewModel()
    @ObservedObject var dataStore: DataStore = DataStore()
    @EnvironmentObject var pizzaVM: DataStore


    var body: some View{
        NavigationView{
            VStack {
                List() {
                    ForEach(pizzaVM.pizzas){ pizza in
                        NavigationLink{
                            DetailView(pizzaName: pizza.name, ingredientName: pizza.ingredients, imageName: pizza.imageName)
                        }
                    label:{
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

struct MeatPage: View{
    @State var foodType = 0
    @ObservedObject var dataStore: DataStore = DataStore()
    @EnvironmentObject var pizzaVM: DataStore

    init() {
        UITableView.appearance().backgroundColor = .red
        
    }
    var body: some View{
        NavigationView{
            ZStack {
                List() {
                    ForEach(pizzaVM.pizzas){ pizza in

      //                  Text("\(pizza.name)")
                        if(pizza.type == PizzaType.meat.rawValue){
                            NavigationLink{
                                DetailView(pizzaName: pizza.name, ingredientName: pizza.ingredients, imageName: pizza.imageName)
                            }
                        label:{
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
    @EnvironmentObject var pizzaVM: DataStore

    var body: some View{
        NavigationView{
            ZStack {
                List() {
                    ForEach(pizzaVM.pizzas){ pizza in
                        if(pizza.type == PizzaType.vegetarian.rawValue){
                            NavigationLink{
                                DetailView(pizzaName: pizza.name, ingredientName: pizza.ingredients, imageName: pizza.imageName)
                            }
                        label:{
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
                }
                .listStyle(InsetGroupedListStyle())
            }
        }
        .navigationViewStyle(.stack)
    }
}
