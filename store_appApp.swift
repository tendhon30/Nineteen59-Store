//
//  store_appApp.swift
//  store app
//
//  Created by Tenzin Dhonyoe on 2022-07-31.
//

import SwiftUI
import Firebase

@main
struct store_appApp: App {
    init(){
        FirebaseApp.configure()
    }
//    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    
    var body: some Scene {
        WindowGroup {
                let viewModel = AppViewModel()
            LogIn()
                .environmentObject(viewModel)
        }
    }
}

//class AppDelegate: NSObject, UIApplicationDelegate{
//    func applicationWillTerminate(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
//
//        FirebaseApp.configure()
//
//        return true
//    }
//}
