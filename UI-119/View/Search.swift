//
//  Search.swift
//  UI-119
//
//  Created by にゃんにゃん丸 on 2021/02/05.
//

import SwiftUI

struct Search: View {
    @Binding var filters : [item]
    
    var body: some View {
        
        ScrollView(.vertical, showsIndicators: false, content: {
            
            VStack{
                ForEach(filters){item in
                    
                    CardView(Item: item)
                    
                    
                }
            }
            .padding()
            
            
        })
        .preferredColorScheme(.dark)
       
    }
}


