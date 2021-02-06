//
//  FooterView.swift
//  UI-119
//
//  Created by にゃんにゃん丸 on 2021/02/05.
//

import SwiftUI

 let gra = LinearGradient(gradient: .init(colors: [.green,.pink]), startPoint: .center, endPoint: .bottomLeading)

struct FooterView: View {
    @State var isdark = false
    @State var offset : CGFloat = 0
    @State var select1 = false
    @State var select2 = false
    @State var select3 = false
    @State var select4 = false
    @State var next = false
    var body: some View {
       
            
            HStack{
                
                Button(action: {
                    select1 = true
                    select2 = false
                    
                }, label: {
                    ZStack{
                        
                        VStack{
                            
                            Image(systemName: "car")
                                .font(.title)
                                .foregroundColor(.primary)
                            
                            Capsule()
                                .fill(Color.clear)
                                .frame(width: 35, height: 3)
                            
                            ZStack{
                                
                                if select1{
                                    
                                    Capsule()
                                        .fill(gra)
                                        .frame(width: 35, height: 3)
                                }
                            }
                        }
                        
                    }
                })
                .frame(maxWidth: .infinity)
                
                Group{
                    
                    Button(action: {
                        select2 = true
                        select1 = false
                        
                    }, label: {
                        
                        ZStack{
                            
                            VStack{
                                
                                Image(systemName: "bolt.car.fill")
                                    .font(.title)
                                    .foregroundColor(.primary)
                                    .offset(x: offset == 0 ? 0 : 50 * (offset / 120))
                                
                                Capsule()
                                    .fill(Color.clear)
                                    .frame(width: 35, height: 3)
                                
                                ZStack{
                                    
                                    if select2{
                                        
                                        Capsule()
                                            .fill(gra)
                                            .frame(width: 35, height: 3)
                                    }
                                }
                            }
                            
                        }
                        
                        
                        
                        
                        
                        
                        
                      
                    })
                    .frame(maxWidth: .infinity)
                    
                    Button(action: {
                        
                        next.toggle()
                        
                        
                    }, label: {
                        Image(systemName: "bus")
                            .font(.title)
                            .foregroundColor(.primary)
                    })
                    .frame(maxWidth: .infinity)
                    
                    Button(action: {
                        withAnimation{
                            
                            isdark.toggle()
                        }
                        
                    }, label: {
                        Image(systemName:isdark ? "bicycle" : "figure.wave")
                            .font(isdark ? .largeTitle :.title)
                            .foregroundColor(isdark ? .red :.primary)
                    })
                    .frame(maxWidth: .infinity)
                    
                }
                .offset(x: offset)
                
                
            }
            .padding(.bottom,UIApplication.shared.windows.first?.safeAreaInsets.bottom ?? 15)
            .padding(.top)
            .frame(height: 80)
            .background(isdark ? Color.black: Color.white)
            .preferredColorScheme(isdark ? .dark : .light)
            .sheet(isPresented: $next, content: {
                
                NEXT()
                
                
            })
            .overlay(
                GeometryReader{proxy -> Color in
                    
                    let maxY = proxy.frame(in: .global).maxY
                    let maxH = UIScreen.main.bounds.height
                    
                    if maxY < maxH{
                        
                        DispatchQueue.main.async {
                            
                            if offset <= 120{
                                
                                let progress = (maxH - maxY) / 100
                                self.offset = progress * 120 <= 120 ? progress * 120 : 120
                                
                                
                            }
                            
                        
                        
               
                    else if offset != 0{
                        
                        self.offset = 0
                    }
                        
                    }
                        
                    }
                    
                    return Color.clear
                    
                }
                ,alignment: .bottom
            
            )
            
        
        
    }
    

}

struct FooterView_Previews: PreviewProvider {
    static var previews: some View {
        FooterView()
    }
}
