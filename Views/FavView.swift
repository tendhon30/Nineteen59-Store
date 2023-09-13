////
////  FavView.swift
////  store app
////
////  Created by Tenzin Dhonyoe on 2022-08-12.
////
//
//import SwiftUI
//
//struct FavView: View {
//    @EnvironmentObject var favManager: FavManager
//    @EnvironmentObject var viewModel: AppViewModel
//
//    var body: some View {
//        ScrollView{
//            if viewModel.profile{
//                if favManager.products.count>0{
//                    ForEach(favManager.products, id: \.id){
//                        product in
//                        FavRow(product: product)
//                    }
//
//                }else {
//                    Text("Favourite is Empty")
//                }
//
//            }
//            else {
//
//                VStack {
//                    Text("Please create an account to add to your Favourites.")
//                        .padding()
//                    NavigationLink {
//                        SignInView()
//
//                    } label: {
//                        Text("Log In Here")
//                            .underline()
//                            .foregroundColor(.blue)
//                    }
//                    Spacer()
//                    NavigationLink {
//                        SignUpView()
//
//                    } label: {
//                        Text("Register Here")
//                            .underline()
//                            .foregroundColor(.blue)
//                    }
//
//                }
//            }
//        }
//        .navigationTitle((Text("Favourites")))
//        .padding()
//    }
//}
//
//
//struct FavView_Previews: PreviewProvider {
//    static var previews: some View {
//        FavView()
//            .environmentObject(FavManager())
//            .environmentObject(AppViewModel())
//    }
//}
