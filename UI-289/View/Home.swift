//
//  Home.swift
//  Home
//
//  Created by nyannyan0328 on 2021/08/19.
//

import SwiftUI

struct Home: View {
    @State var currentTab = "Mail"
    
    @State var hyed = false
    
    var bottomEdge : CGFloat
    init(bottomEdge : CGFloat){
        
        self.bottomEdge = bottomEdge
        
        UITabBar.appearance().isHidden = true
    }
    var body: some View {
        TabView(selection:$currentTab){
            
            
          MailView(hyed: $hyed, bottomEdge: bottomEdge)
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .background(Color.black.opacity(0.03))
                .tag("Mail")
            
            
           SiginMainView()
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .background(Color.black.opacity(0.03))
                .tag("Meet")
            
            
            
            
        }
        .overlay(
            
            VStack{
                
                
                Button {
                    hyed.toggle()
                } label: {
                    HStack(spacing: hyed ? 0 : 5){
                        
                        
                        Image(systemName: "pencil")
                            .font(.title.italic())
                        
                        Text("Compose")
                            .font(.custom("Sketch 3D", size: 18))
                            .frame(width: hyed ? 0 : nil, height: hyed ? 0 : nil)
                        
                    }
                    .foregroundColor(.black)
                    .padding(.vertical,hyed ? 10 : 15)
                    .padding(.horizontal,20)
                    .background(Color("TabBG"),in: Capsule())
                    .opacity(currentTab == "Mail" ? 1 : 0)
                    .animation(.none, value: currentTab)
                }
                .padding(.trailing,5)
                .frame(maxWidth: .infinity,alignment: .trailing)

                
                CustomTabBar(currentTab: $currentTab, bottomEdge: bottomEdge)
            }
                .offset(y: hyed ? (65 + bottomEdge) : 0)
            
        
        
        
            ,alignment: .bottom
        )
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
