//
//  LogIn.swift
//  store app
//
//  Created by Tenzin Dhonyoe on 2022-08-10.
//

import SwiftUI
import FirebaseAuth

class AppViewModel: ObservableObject{
    
    let auth = Auth.auth()
    
    @Published var signedIn = false
    @Published var profile = false
    
    var isSignedIn: Bool{
        return auth.currentUser != nil
    }
    
    func signIn(email: String, password: String){
        auth.signIn(withEmail: email, password: password) {
            [weak self] result, error in
            
            guard result != nil, error == nil else{
                return
            }
            
            DispatchQueue.main.async {
                self?.signedIn=true
                self?.profile = true
            }
            // Success
            
        }
    }
    
    func signAnonymous(){
        auth.signInAnonymously(){
            [weak self] result, error in
            
            DispatchQueue.main.async {
                self?.signedIn=true
                self?.profile=false
            }
        }
    }
    
    func signUp(email: String, password: String){
        auth.createUser(withEmail: email, password: password) {
            [weak self] result, error in
            
            guard result != nil, error == nil else{
                return
                
            }
            DispatchQueue.main.async {
                self?.signedIn=true
                self?.profile = true
            }
            
        }
        
    }
    
    func signOut(){
        try? auth.signOut()
        
        self.signedIn = false
        self.profile = false
        
    }
}

struct LogIn: View {
    
    @EnvironmentObject var viewModel: AppViewModel
    
    var body: some View {
        NavigationView{
            ZStack{
                if viewModel.signedIn{
                    
                    ContentView()
                    
                    //                VStack{
                    //                    Button(action: {
                    //                        viewModel.signOut()
                    //                    }, label: {
                    //                        Text("Sign Out")
                    //                            .background(Color.green)
                    //                            .foregroundColor(.blue)
                    //                            .padding()
                    //                    })
                    //                }
                }
                else{
                    Started()
                }
            }
            .onAppear {
                viewModel.signedIn = viewModel.isSignedIn
            }
        }
    }
    
}

struct Started: View {
    
    var body: some View {
        ZStack {
            Image("0").resizable()
                .aspectRatio(contentMode: .fill)
                .ignoresSafeArea()
            
            //button instance with label view
            
            VStack {
                Spacer()
                NavigationLink{
                    LogRegister()
                        .navigationBarBackButtonHidden(true)
                }
            label: {
                Image("getstarted").resizable()
                    .frame(width: 300, height: 120)
                    .padding(.bottom, 70.0)
            }
                
            }
            
        }
        
        
    }
}

struct LogRegister: View {
    
    @EnvironmentObject var viewModel: AppViewModel
    
    var body: some View {
        ZStack {
            Image("loginBack")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .ignoresSafeArea()
            
            VStack {
                
                Spacer()
                
                Spacer()
                
                Image("logo2")
                    .resizable()
                    .frame(width: 250, height: 100)
                
                Spacer()
                
                Button {
                    viewModel.signAnonymous()
                } label: {
                    Image("guest").resizable()
                        .frame(width: 350, height: 70)
                        .padding(.top, 150.0)
                }
                
                NavigationLink{
                    SignInView()
                        .navigationBarBackButtonHidden(true)
                }
            label: {
                Image("login").resizable()
                    .frame(width: 350, height: 70)
            }
                
                NavigationLink{
                    SignUpView()
                        .navigationBarBackButtonHidden(true)
                }
            label: {
                Image("register").resizable()
                    .frame(width: 350, height: 70)
            }
                
                Spacer()
                
                
            }
        }
        
        
    }
}


struct SignInView: View {
    @State var email = ""
    @State var password = ""
    
    @EnvironmentObject var viewModel: AppViewModel
    
    var body: some View {
        
        ZStack {
            VStack {
                
                Image("signinBack")
                    .resizable()
                    .frame(width: 390, height:380)
                    .padding(.vertical, 10.0)
                
                VStack{
                    Text("Email")
                        .bold()
                        .padding(.trailing, 310.0)
                    
                    
                    TextField("name@gmail.com", text: $email)
                        .disableAutocorrection(true)
                        .autocapitalization(.none)
                        .padding()
                        .background(Color(.secondarySystemBackground))
                        .cornerRadius(10)
                        .frame(width: 370)
                    
                    
                    Text("Password")
                        .bold()
                        .padding(.trailing, 280.0)
                    
                    
                    SecureField("*********", text: $password)
                        .disableAutocorrection(true)
                        .autocapitalization(.none)
                        .padding()
                        .background(Color(.secondarySystemBackground))
                        .cornerRadius(10)
                        .frame(width: 370)
                }
                
                Spacer()
                Button {
                    guard !email.isEmpty, !password.isEmpty else{
                        return
                    }
                    viewModel.signIn(email: email, password: password)
                } label: {
                    Image("login")
                        .resizable()
                        .frame(width: 350, height: 70)
                    
                }
                
                HStack {
                    Text("Not Registered Yet?")
                        .bold()
                        .foregroundColor(.gray)
                    
                    NavigationLink {
                        SignUpView()
                            .navigationBarBackButtonHidden(true)
                    } label: {
                        CreateAccount()
                    }
                    
                }
                
            }
        }
        .navigationTitle("LOG IN")
        
    }
}

struct SignUpView: View {
    @State var email = ""
    @State var password = ""
    
    @EnvironmentObject var viewModel: AppViewModel
    
    var body: some View {
        
        ZStack {
            VStack {
                ZStack {
                    Image("signupBack")
                        .resizable()
                        .frame(width: 390, height:400)
                        .padding(.top, 10.0)
                    
                    VStack {
                        Text("GET STARTED TODAY WITH NINETEEN59")
                            .bold()
                            .font(.title)
                            .multilineTextAlignment(.leading)
                            .padding(.trailing, 70.0)
                        
                        Text("Already have an account?")
                            .bold()
                            .multilineTextAlignment(.leading)
                            .padding(.trailing, 150.0)
                        
                        NavigationLink {
                            SignInView()
                                .navigationBarBackButtonHidden(true)
                        } label: {
                            Text ("Log In")
                                .foregroundColor(.blue)
                                .padding(.trailing, 305.0)
                                .padding(.top, 5.0)
                        }
                        
                    }
                    
                }
                
                Spacer()
                Spacer()
                
                VStack{
                    Text("Email")
                        .bold()
                        .padding(.trailing, 310.0)
                    
                    
                    TextField("name@gmail.com", text: $email)
                        .disableAutocorrection(true)
                        .autocapitalization(.none)
                        .padding()
                        .background(Color(.secondarySystemBackground))
                        .cornerRadius(10)
                        .frame(width: 370)
                    
                    
                    Text("Password")
                        .bold()
                        .padding(.trailing, 280.0)
                    
                    
                    SecureField("*********", text: $password)
                        .disableAutocorrection(true)
                        .autocapitalization(.none)
                        .padding()
                        .background(Color(.secondarySystemBackground))
                        .cornerRadius(10)
                        .frame(width: 370)
                }
                
                Spacer()
                
                Button {
                    guard !email.isEmpty, !password.isEmpty else{
                        return
                    }
                    viewModel.signUp(email: email, password: password)
                } label: {
                    Image("register")
                        .resizable()
                        .frame(width: 350, height: 70)
                    
                }
                
            }
            
            
        }
        .navigationTitle("REGISTER")
        
    }
}

struct FavView: View {
    @EnvironmentObject var favManager: FavManager
    @EnvironmentObject var viewModel: AppViewModel
    
    var body: some View {
        ScrollView{
            if viewModel.profile{
                if favManager.products.count>0{
                    ForEach(favManager.products, id: \.id){
                        product in
                        FavRow(product: product)
                    }
                    
                }else {
                    Text("Favourite is Empty")
                }
                
            }
            else {
            
                VStack {
                    Text("Please create an account to add to your Favourites.")
                        .padding()
                    NavigationLink {
                        SignInView()
    
                    } label: {
                        Text("Log In Here")
                            .underline()
                            .foregroundColor(.blue)
                    }
                    Spacer()
                    NavigationLink {
                        SignUpView()
  
                    } label: {
                        Text("Register Here")
                            .underline()
                            .foregroundColor(.blue)
                    }
                    
                }
            }
        }
        .navigationTitle((Text("Favourites")))
        .padding()
    }
}

struct ContentView: View {
    @StateObject var cartManager = CartManager()
    @StateObject var favManager = FavManager()
    
    @EnvironmentObject var viewModel: AppViewModel
    
    var columns = [GridItem(.adaptive(minimum: 160), spacing:20)]
    @State var searchText = ""
    @State var isSearching = false
    
    @State var selectedIndex = 1
    let tabBarImageNames = ["house", "square.and.pencil", "bag", "questionmark.square"]
    
    var body: some View {
        VStack{
            ZStack{
                switch selectedIndex{
                case 0:
                    //Home
                    ScrollView {
                        VStack{
                            Image("Featured Product")
                                .resizable()
                                .frame(width: 220, height: 50)
                                .padding(.top, 10.0)
                            
                            Button {
                                selectedIndex = 1
                            } label: {
                                Image("newDesigns")
                                    .resizable()
                                    .frame(height: 300)
                                
                            }
                            
                            Image("Better Together")
                                .resizable()
                                .frame(width: 390, height: 220)
                                .padding(.top, 10.0)
                            
                            Image("About us")
                                .resizable()
                                .frame(width: 200, height: 40)
                                .padding(.top, 10.0)
                            
                            Text("Nineteen59 is a strong reminder of how much work is needed to bring the topic of Tibet and the Tibetan movement to the forefront of our collective agenda. We understand the great significance behind the year and we hope to use that to instil the values of identity, creativity, and education for our community. Our intentions are to motivate and inspire Tibetans to understand their roots while pursuing their goals.")
                                .padding(.horizontal, 30.0)
                            
                            Link(destination: URL(string: "https://www.nineteen59.net/info")!) {
                                Image("learnMore")
                                    .resizable()
                                    .frame(width: 150, height: 32)
                                    .padding(.top, 10.0)
                            }
                            
                            Image("Our Work")
                                .resizable()
                                .frame(width: 170, height: 35)
                                .padding(.top, 10.0)
                            
                            Button {
                                selectedIndex = 2
                            } label: {
                                Image("work")
                                    .resizable()
                                    .frame(width: 350, height: 500)
                                    .padding(.top, 10.0)
                                
                                
                            }

                            
                            HStack{
                                
                                Image("Follow us")
                                    .resizable()
                                    .frame(width: 100, height: 20)
                                    .padding(.top, 10.0)
                                
                                Link(destination: URL(string: "https://www.instagram.com/nineteen59/")!) {
                                    Text("@Nineteen59")
                                        .underline()
                                        .padding(.top, 10.0)
                                }
                                
                            }
                            .padding(.vertical, 20.0)
                            Spacer()
                            
                        }
                    }
                    .navigationTitle(Text("Welcome"))
                    .toolbar {
                        HStack{
                            NavigationLink{
                                FavView()
                                    .environmentObject(favManager)
                                    .environmentObject(cartManager)
                            } label:{
                                //                                Image(systemName: "heart")
                                Text("Favourites")
                                    .underline()
                            }
                            
                            Spacer()
                            
                            NavigationLink{
                                CartView()
                                    .environmentObject(cartManager)
                                    .environmentObject(favManager)
                            } label:{
                                CartButton(numberOfProducts: cartManager.products.count)
                                
                            }
                            Button {
                                viewModel.signOut()
                            } label: {
                                Text("Log Out")
                                    .underline()
                            }
                        }
                        .padding()
                        
                    }
                    .navigationViewStyle(StackNavigationViewStyle())
                    
                case 1:
                    //Shop
                    ScrollView {
                        SearchView(searchText: $searchText, isSearching: $isSearching)
                        
                        LazyVGrid(columns: columns, spacing:20) {
                            ForEach(productList.filter({"\($0)".contains(searchText) || searchText.isEmpty}), id: \.id){ product in
                                ProductCard(product: product)
                                    .environmentObject(cartManager)
                                    .environmentObject(favManager)
                            }
                        }
                        .padding()
                        HStack{
                            
                            Image("Follow us")
                                .resizable()
                                .frame(width: 100, height: 20)
                                .padding(.top, 10.0)
                            
                            Link(destination: URL(string: "https://www.instagram.com/nineteen59/")!) {
                                Text("@Nineteen59")
                                    .underline()
                                    .padding(.top, 10.0)
                            }
                            
                        }
                        .padding(.bottom, 30.0)
                        Spacer()
                    }
                    .navigationTitle(Text("Shop"))
                    .toolbar {
                        HStack{
                            NavigationLink{
                                FavView()
                                    .environmentObject(favManager)
                                    .environmentObject(cartManager)
                            } label:{
                                //                                Image(systemName: "heart")
                                Text("Favourites")
                                    .underline()
                            }
                            
                            Spacer()
                            
                            NavigationLink{
                                CartView()
                                    .environmentObject(cartManager)
                                    .environmentObject(favManager)
                            } label:{
                                CartButton(numberOfProducts: cartManager.products.count)
                                
                            }
                            Button {
                                viewModel.signOut()
                            } label: {
                                Text("Log Out")
                                    .underline()
                            }
                            
                            
                        }
                        .padding()
                        
                    }
                    .navigationViewStyle(StackNavigationViewStyle())
                    
                    
                case 2:
                    //our work
                    ScrollView {
                        Image("Our Stories")
                            .resizable()
                            .frame(width: 200, height: 40)
                            .padding(.top, 10.0)
                        
                        Image("our")
                            .resizable()
                            .frame(width: 350, height: 500)
                            .padding(.top, 10.0)
                        
                        Link(destination: URL(string: "https://www.nineteen59.net/ourstories")!) {
                            Image("learnMore")
                                .resizable()
                                .frame(width: 150, height: 32)
                                .padding(.top, 10.0)
                        }
                        
                        Image("Dakpogyop")
                            .resizable()
                            .frame(width: 200, height: 40)
                            .padding(.top, 20.0)
                        
                        Image("dakpo")
                            .resizable()
                            .frame(width: 350, height: 500)
                            .padding(.top, 10.0)
                        
                        Link(destination: URL(string: "https://www.nineteen59.net/dakpogyop")!) {
                            Image("learnMore")
                                .resizable()
                                .frame(width: 150, height: 32)
                                .padding(.top, 10.0)
                        }
                    
                        Image("senior")
                            .resizable()
                            .frame(width: 200, height: 40)
                            .padding(.top, 15.0)
                        
                        Image("annual")
                            .resizable()
                            .frame(width: 350, height: 350)
                            .padding(.top, 10.0)
                        
                        Link(destination: URL(string: "https://www.nineteen59.net/community-events")!) {
                            Image("learnMore")
                                .resizable()
                                .frame(width: 150, height: 32)
                                .padding(.top, 10.0)
                        }
                        
                        HStack{
                            
                            Image("Follow us")
                                .resizable()
                                .frame(width: 100, height: 20)
                                .padding(.top, 10.0)
                            
                            Link(destination: URL(string: "https://www.instagram.com/nineteen59/")!) {
                                Text("@Nineteen59")
                                    .underline()
                                    .padding(.top, 10.0)
                            }
                            
                        }
                        .padding(.bottom, 30.0)
                        
                        
                    }
                    .navigationTitle(Text("Our Work"))
                    .toolbar {
                        HStack{
                            NavigationLink{
                                FavView()
                                    .environmentObject(favManager)
                                    .environmentObject(cartManager)
                            } label:{
                                //                                Image(systemName: "heart")
                                Text("Favourites")
                                    .underline()
                            }
                            
                            Spacer()
                            
                            NavigationLink{
                                CartView()
                                    .environmentObject(cartManager)
                                    .environmentObject(favManager)
                            } label:{
                                CartButton(numberOfProducts: cartManager.products.count)
                                
                            }
                            Button {
                                viewModel.signOut()
                            } label: {
                                Text("Log Out")
                                    .underline()
                            }
                        }
                        .padding()
                    }
                    .navigationViewStyle(StackNavigationViewStyle())
                    
                default:
                    Text("Error please reload the app.")
                }
            }
            
            Spacer()
            
            HStack{
                Spacer()
                Button {
                    selectedIndex = 0
                } label: {
                    Text("HOME")
                        .underline(selectedIndex == 0)
                        .foregroundColor(selectedIndex == 0 ? Color(.black): .gray)
                }
                Spacer()
                Button {
                    selectedIndex = 1
                } label: {
                    Text("SHOP")
                        .underline(selectedIndex == 1)
                        .foregroundColor(selectedIndex == 1 ? Color(.black): .gray)
                }
                Spacer()
                Button {
                    selectedIndex = 2
                } label: {
                    Text("OUR WORK")
                        .underline(selectedIndex == 2)
                        .foregroundColor(selectedIndex == 2 ? Color(.black): .gray)
                }
                Spacer()
                
            }
        }
        
    }
}


struct SearchView: View {
    
    @Binding var searchText: String
    @Binding var isSearching: Bool
    
    var body: some View {
        HStack {
            HStack{
                TextField("Search Items", text: $searchText)
                    .padding(.leading, 24)
                    .disableAutocorrection(true)
            }
            .padding()
            .background(Color(.systemGray4))
            .cornerRadius(12)
            .padding(.horizontal)
            .onTapGesture {
                isSearching = true
            }
            .overlay(
                HStack{
                    Image(systemName: "magnifyingglass")
                    Spacer()
                    
                    if isSearching{
                        Button {
                            searchText = ""
                        } label: {
                            Image(systemName: "xmark.circle.fill")
                                .padding(.vertical)
                        }
                        
                    }
                    
                }.padding(.horizontal, 32)
                    .foregroundColor(.gray)
            ).transition(.move(edge: .trailing))
                .animation(.easeIn, value: 100)
            
            
            if isSearching{
                Button {
                    isSearching = false
                    searchText = ""
                    
                    UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
                    
                } label: {
                    Text("Cancel")
                        .foregroundColor(.blue)
                        .padding(.trailing)
                        .padding(.leading, -12)
                }
                .transition(.move(edge: .trailing))
                .animation(.easeIn, value: 300)
                
            }
            
            
        }
    }
}

struct LogIn_Previews: PreviewProvider {
    static var previews: some View {
        LogIn()
            .environmentObject(AppViewModel())
//            .environmentObject(FavManager())
//            .environmentObject(AppViewModel())
    }
}

