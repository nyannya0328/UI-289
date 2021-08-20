//
//  ContentView.swift
//  UI-289
//
//  Created by nyannyan0328 on 2021/08/19.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        GeometryReader{proxy in
            
            let bottomEdge = proxy.safeAreaInsets.bottom
            
            
            Home(bottomEdge: bottomEdge)
                .ignoresSafeArea(.all, edges: .bottom)
        }
        .overlay(SplashScreen())
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
