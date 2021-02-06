//
//  CardView.swift
//  UI-119
//
//  Created by にゃんにゃん丸 on 2021/02/05.
//

import SwiftUI

struct CardView: View {
    @State var show = false
    var Item : item
   
    
        
       
        var body: some View {
            HStack{
                Image(Item.name)
                    .resizable()
                    .frame(width: 65, height: 65)
                    .cornerRadius(20)
            
            
            
            VStack{
                HStack{
                    
                    VStack(alignment: .leading, spacing: 20){
                        
                        Text(Item.name)
                            .font(.title)
                            .foregroundColor(.gray)
                        
                        Text(Item.source)
                            .font(.caption)
                            .foregroundColor(.gray)
                        
                        
                    }
                    
                    Spacer(minLength: 0)
                    
                    VStack{
                    
                    Button(action: {
                        
                        show.toggle()
                        
                    }){
                        
                        Text(show ? "Change" : "Tap")
                            .fontWeight(.heavy)
                            .padding(.vertical,10)
                            .padding(.horizontal,15)
                            .background(Color.primary.opacity(0.1))
                            .clipShape(Capsule())
                        
                    }
                    Text("All")
                        .font(.caption)
                        .foregroundColor(.gray)
                    
                    
                }
                   
                    
                }
                Divider()
                
                
            }
            
        }
            .padding()
    }
    

}

