//
//  NEXT.swift
//  UI-119
//
//  Created by にゃんにゃん丸 on 2021/02/06.
//

import SwiftUI

struct NEXT: View {
    @State var Filteritems = items
    var body: some View {
        CustomNV(view: AnyView(Search(filters: $Filteritems)), placefolder: "Enter", largetitle: true, title: "title", onsearch: { (txt) in
         
            
            if txt != ""{
                self.Filteritems = items.filter{$0.name.lowercased().contains(txt.lowercased())}
                
            }
            else{
                
                self.Filteritems = items
            }
            
            
            
        }, oncancell: {
            
            self.Filteritems = items
            
        })
        
        
        .ignoresSafeArea()
    }
}

struct NEXT_Previews: PreviewProvider {
    static var previews: some View {
        NEXT()
    }
}
