//
//  MailView.swift
//  MailView
//
//  Created by nyannyan0328 on 2021/08/19.
//

import SwiftUI

struct MailView: View {
    @Binding var hyed : Bool
    var bottomEdge : CGFloat
    @State var offset : CGFloat = 0
    @State var lastoffset : CGFloat = 0
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            
            
            VStack(alignment: .leading, spacing: 15) {
                
                
                ForEach(messages){msg in
                    
                    
                    cardView(msg: msg)
                }
            }
            .padding()
            .overlay(
            
                GeometryReader{proxy -> Color in
                    
                    let minY = proxy.frame(in: .named("SCROLL")).minY
                    
                    let durationoffset : CGFloat = 35
                    
                    
                    
                    DispatchQueue.main.async {
                        
                        if minY < offset {
                            
                            
                            
                            if offset < 0 && -minY > (lastoffset + durationoffset){
                                
                                withAnimation(.linear.speed(0.8)){
                                    
                                    hyed = true
                                }
                                
                                lastoffset = -offset
                                
                                
                            }
                           
                            
                            
                        }
                        
                        
                        if minY > offset && -minY < (lastoffset - durationoffset){
                            
                           
                            
                            
                            withAnimation(.linear.speed(0.8)){
                                
                                hyed = false
                            }
                            
                            
                            lastoffset = -offset
                            
                            
                            
                            
                            
                        }
                        
                        self.offset = minY
                    }
                    
                   
                    
                    
                    
                    
                    return Color.clear
                    
                    
                }
            
            )
            
            
            
            
        }
        .coordinateSpace(name: "SCROLL")
    }
    
    @ViewBuilder
    func cardView(msg: Message) -> some View{
        
        HStack{
            
            Text(String(msg.userName.first ?? "A"))
                .font(.custom("Sketch 3D", size: 30))
             
            
            
            
            
            VStack(alignment: .leading, spacing: 15) {
                
                
                Text(msg.userName)
                    .font(.custom("Sketch 3D", size: 30))
                    .foregroundColor(.green)
                
                
                Divider()
                
                
                Text(msg.message)
                    .font(.custom("Sketch 3D", size: 20))
        
                
                
            }
            
                
                
            
        }
        .frame(maxWidth: .infinity,alignment: .leading)
        
          
        
        
    }
    
}

struct MailView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

