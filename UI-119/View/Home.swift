//
//  Home.swift
//  UI-119
//
//  Created by にゃんにゃん丸 on 2021/02/05.
//

import SwiftUI

struct Home: View {
    var split_Article : [[String]]{
        
        let mid = articlepage.count / 2
        var split_Array1 : [String] = []
        var split_Array2 : [String] = []
        
        for index in 0..<mid - 1 {split_Array1.append(articlepage[index])}
        
        for index in mid..<articlepage.count {split_Array2.append(articlepage[index])}
        
        return [split_Array1,split_Array2]
        
    }
    
    var body: some View {
        ScrollView{
            
            LazyVStack(spacing: 10, pinnedViews: [.sectionFooters], content: {
                
                Section(footer: FooterView(), content: {
                    
                    Text("I will do my best\nI feel accept")
                        .font(.title)
                        .fontWeight(.heavy)
                        .foregroundColor(.primary)
                        .multilineTextAlignment(.center)
                        .padding()
                        .frame(maxWidth: .infinity,alignment: .leading)
                    
                    HStack(spacing:15){
                        Image("pro")
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 35, height: 35)
                            .clipShape(Circle())
                        
                        VStack(spacing:15){
                            
                            Text("Profile")
                                .font(.title2)
                                .fontWeight(.semibold)
                                .foregroundColor(.pink)
                            
                            Text("My name is Cat")
                                .font(.title3)
                                .fontWeight(.regular)
                                .foregroundColor(.gray)
                            
                        }
                            
                            Spacer()
                            
                            Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                                Image(systemName: "pencil")
                                    .font(.title)
                                    .foregroundColor(.purple)
                                    
                            })
                            
                            Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                                Image(systemName: "square.and.arrow.up.fill")
                                    .font(.title2)
                                    .foregroundColor(.blue)
                                    
                            })
                            
                        
                        
                    }
                    .padding(.horizontal)
                    
                    ForEach(split_Article[0],id:\.self){index in
                        
                        Text(index)
                            .foregroundColor(.primary)
                            .padding(.horizontal)
                            .padding(.top,10)
                        
                    }
                    
                    Image("p1")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .padding(.horizontal)
                        .padding(.top,10)
                    
                    
                    ForEach(split_Article[1],id:\.self){index in
                        
                        Text(index)
                            .foregroundColor(.primary)
                            .padding(.horizontal)
                            .padding(.top,10)
                        
                    }
                    
                    Image("p2")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .padding(.horizontal)
                        .padding(.top,10)
                  
                    
                })
                
                Text("Feautured")
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundColor(Color.primary)
                    .padding(.horizontal)
                    .frame(maxWidth: .infinity,alignment: .leading)
                
                
                PageController()
                    .padding(.bottom)
                
                
                
                
               
            })
        }
        .ignoresSafeArea(.all, edges: .bottom)
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}

struct PageController : View {
    var body: some View{
        
        VStack(spacing:15){
            
            HStack(spacing:15){
                
                Image("p3")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 50, height: 50)
                    .cornerRadius(10)
                
                Text("Moon")
                    .font(.callout)
                    .fontWeight(.bold)
                    .foregroundColor(.gray)
            }
            .frame(maxWidth: .infinity,alignment: .leading)
            
            HStack(spacing:15){
                
                Image("p4")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 50, height: 50)
                    .cornerRadius(10)
                
                Text("Dog")
                    .font(.subheadline)
                    .fontWeight(.light)
                    .foregroundColor(.gray)
            }
            .frame(maxWidth: .infinity,alignment: .leading)
            
            HStack(spacing:15){
                
                Image("p5")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 50, height: 50)
                    .cornerRadius(10)
                
                Text("Cat")
                    .font(.footnote)
                    .fontWeight(.medium)
                    .foregroundColor(.gray)
            }
            .frame(maxWidth: .infinity,alignment: .leading)
        }
        .padding()
        
    }
}
