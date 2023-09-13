//
//  TabBar.swift
//  store app
//
//  Created by Tenzin Dhonyoe on 2022-09-01.
//

import SwiftUI

struct TabBar: View {
    
    @State var selectedIndex = 0
    let tabBarImageNames = ["house", "square.and.pencil", "bag", "questionmark.square"]
    
    var body: some View {
        VStack{
            ZStack{
                
                switch selectedIndex{
                case 0:
                    NavigationView{
                        Text("First")
                            .navigationTitle("First Tab")
                    }
                    
                case 1:
                    ScrollView{
                        Text("TEST")
                    }
                    
                default:
                    Text("Remaining tabs")
                }
            }
            
            Spacer()
            
            HStack{

                Spacer()
                Button {
                    selectedIndex = 0
                } label: {
                    Text("Home")
                        .underline(selectedIndex == 0)
                        .foregroundColor(selectedIndex == 0 ? Color(.black): .gray)
                }
                Spacer()
                Button {
                    selectedIndex = 1
                } label: {
                    Text("Our Work")
                        .underline(selectedIndex == 1)
                        .foregroundColor(selectedIndex == 1 ? Color(.black): .gray)
                }
                Spacer()
                Button {
                    selectedIndex = 2
                } label: {
                    Text("Shop All")
                        .underline(selectedIndex == 2)
                        .foregroundColor(selectedIndex == 2 ? Color(.black): .gray)
                }
                Spacer()
                Button {
                    selectedIndex = 3
                } label: {
                    Text("About Us")
                        .underline(selectedIndex == 3)
                        .foregroundColor(selectedIndex == 3 ? Color(.black): .gray)
                }
                Spacer()

            }
        }
    }
}

struct TabBar_Previews: PreviewProvider {
    static var previews: some View {
        TabBar()
    }
}
