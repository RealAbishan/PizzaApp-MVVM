//
//  DetailView.swift
//  PizzaApp-MVVM
//
//  Created by Abishan Parameswaran on 2023-03-09.
//

import SwiftUI

struct DetailView: View {
    
    var pizzaName: String = ""
    var ingredientName: String = ""
    var imageName: String = ""
    @EnvironmentObject var dataStore: DataStore

    var body: some View {
        VStack(spacing: 20){
            
            VStack{
                Image("\(imageName)")
                    .resizable()
                    .scaledToFit()
                    .cornerRadius(30)
                    .frame(maxWidth: .infinity)
                    .frame(height: 300)
                    .textCase(.uppercase)
            }
            
            VStack{
                Text("\(pizzaName)")
                    .font(.system(size: 30))
                    .bold()
                    .tracking(6)
                    .frame(maxWidth: .infinity)
            }
            VStack{
                HStack{
                    Text("Ingredients: ")
                        .bold().font(.system(size: 24)) + Text("\(ingredientName)").font(.system(size: 24))
                }
                .frame(maxWidth: .infinity)
                .padding()
            }
            VStack{
                Button {
                    //
                } label: {
                    HStack{
                        Image(systemName: "heart")
                            .font(.title)
                        Text("Add to Favourites")
                            .fontWeight(.semibold)
                            .font(.title)
                    }
                    .frame(minWidth: 0, maxWidth: .infinity)
                    .padding()
                    .foregroundColor(.white)
                    .background(LinearGradient(gradient: Gradient(colors: [Color.orange, Color.orange.opacity(0.3)]), startPoint: .leading, endPoint: .trailing))
                    .cornerRadius(40)
                }
            }
        }
        .padding()
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView()
            .environmentObject(DataStore())

    }
}
