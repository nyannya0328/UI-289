//
//  SiginMainView.swift
//  SiginMainView
//
//  Created by nyannyan0328 on 2021/08/19.
//

import SwiftUI

struct SiginMainView: View {
    @State var titletext : [TextAnimation] = []
    
    
    @State var titles = [
    
    "Clean your mind from",//,need
    "Unique experience",
    "The ultimate program",
    "Butiful Mountain"
    
    
    ]
    
    @State var subTitles = [
    
    "Negativity - stress - Anxiety",
    "Prepare your mind for sweet dream",
    "Healty mind - better sleep - well being",
    "The Moring coffee"
    
    
    ]
    
    
    @State var currentIndex : Int = 3
    @State var subTitleAnimation = false
    @State var endAnimation = false
    var body: some View {
        ZStack{
            
            GeometryReader{proxy in
                
                let size = proxy.size
                
                Color.blue
                
                ForEach(1...4,id:\.self){index in
                    
                    Image("p\(index)")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width:size.width , height: size.height)
                        .opacity(currentIndex == (index - 1) ? 1 : 0)
                }
                
                
                LinearGradient(colors: [
                
                    .green.opacity(0.3),
                    .red.opacity(0.3),
                    .clear
                
                
                ], startPoint: .top, endPoint: .bottom)
            }
            .ignoresSafeArea()
            
            VStack{
                
                HStack(spacing:0){
                    
                    
                    
                    ForEach(titletext){text in
                        
                        Text(text.text)
                            .offset(y: text.offset)
                    }
                    .font(.largeTitle.weight(.black))
                }
                .offset(y: endAnimation ? -100 : 0)
                .opacity(endAnimation ? 0 : 1)
                
                
                Text(subTitles[currentIndex])
                    .offset(y: !subTitleAnimation ? 80 : 0)
                    .offset(y: endAnimation ? -100 : 0)
                    .opacity(endAnimation ? 0 : 1)
                
                
                
                TabButton(image: "applelogo", title: "Sign With Apple", isSystem: true) {
                    
                }
                .padding(.top,10)
                
                TabButton(image: "google", title: "Sign With Google", isSystem: false) {
                    
                }
                
                TabButton(image: "facebook", title: "Sign With FB", isSystem: false) {
                    
                }
            }
            .foregroundColor(.white)
            .frame(maxHeight: .infinity, alignment: .bottom)
            
            
        }
        .onAppear {
            currentIndex = 0
        }
        .onChange(of: currentIndex) { newValue in
            
            getSpilited(text: titles[currentIndex]) {
                
                
                withAnimation(.easeInOut(duration: 1)){
                    
                    
                    endAnimation.toggle()
                }
                
                
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.9) {
                    
                    titletext.removeAll()
                    endAnimation.toggle()
                    subTitleAnimation.toggle()
                    
                    
                    withAnimation(.easeInOut(duration: 0.6)){
                        
                        if currentIndex < (titles.count - 1){currentIndex += 1}
                        
                        
                        else{currentIndex = 0}
                        
                    }
                    
                    
                }
            }
            
            
        }
    }
    
    func getSpilited(text : String,Conpetition : @escaping()->()){
        
        
        for (index,character) in text.enumerated(){
            
            
            titletext.append(TextAnimation(text: String(character)))
            
            
            DispatchQueue.main.asyncAfter(deadline: .now() + Double(index) * 0.03) {
                
                
                withAnimation(.easeInOut(duration: 0.3)){
                    
                  titletext[index].offset = 0
                }
                
                
                
                
            }
        }
        
        
        DispatchQueue.main.asyncAfter(deadline: .now() + Double(text.count) * 0.02) {
            
            
            withAnimation(.easeInOut(duration: 0.5)){
                
                
                subTitleAnimation.toggle()
            }
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.95) {
                
                
                Conpetition()
            }
            
            
            
        }
        
    }
}

struct SiginMainView_Previews: PreviewProvider {
    static var previews: some View {
        SiginMainView()
    }
}

struct TabButton : View{
    
    var image : String
    var title : String
    var isSystem : Bool
    var ontap : ()->()
    
    var body: some View{
        
        
        
        HStack{
            
            
            (
                
                
                isSystem ? Image(systemName: image) : Image(image)
            
            
            
            )
                .resizable()
                .renderingMode(.template)
                .frame(width: 30, height: 30)
            
            Text(title)
                .font(.custom("Sketch 3D", size: 30))
                .frame(maxWidth: .infinity)
            
        }
        .foregroundColor(isSystem ? .gray : .white)
        .padding(.vertical,15)
        .padding(.horizontal,20)
        .background(
            Color.white.opacity(isSystem ? 1 : 0.1),in: RoundedRectangle(cornerRadius: 20)
        )
        .onTapGesture {
            
            ontap()
        }
        
     
    }
    
    
}
