//
//  CustomTabBar.swift
//  CustomTabBar
//
//  Created by nyannyan0328 on 2021/08/19.
//

import SwiftUI

struct CustomTabBar: View {
    
    @Binding var currentTab : String
    var bottomEdge : CGFloat
    var body: some View {
        HStack(spacing:0){
            
            
            
            ForEach(["Mail","Meet"],id:\.self){image in
                
                
                CustomTabButton(image: image, currentTab: $currentTab, bottomEge: bottomEdge, badge: image == "Mail" ? 99 : 0)
                
            }
        }
        .padding(.top,15)
        .padding(.bottom,bottomEdge)
        .background(Color("TabBG"))
    }
}

struct CustomTabBar_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct CustomTabButton : View{
    
  
    var image : String
    @Binding var currentTab : String
    
    var bottomEge : CGFloat
    
    
    var badge : Int
    
    @Environment(\.colorScheme) var scheme
    
    var body: some View{
        
        
        Button {
            
            withAnimation{
                
                currentTab = image
            }
            
        } label: {
            
            Image(image)
                .resizable()
                .renderingMode(.template)
                .aspectRatio(contentMode: .fit)
                .frame(width: 50, height: 50)
                .foregroundColor(currentTab == image ? Color("Pink") : .gray.opacity(0.7))
                
                .overlay(
                
                    
                    Text("\(badge < 100 ? badge : 99)+")
                        .font(.caption.bold())
                        .foregroundColor(scheme == .dark ? .black : .white)
                        .padding(.vertical,5)
                        .padding(.horizontal,5)
                        .background(Color("Pink"),in: Capsule())
                        .background(
                        
                        Capsule()
                            .stroke(scheme == .dark ? .black : .white)
                        
                        )
                    
                        .opacity(badge == 99 ? 1 : 0)
                        .offset(x: 25, y: 0)
                    
                    ,alignment: .topTrailing
                    
                    
                
                       
                
                )
                .frame(maxWidth: .infinity)
                
        }

    }
    
    
}
