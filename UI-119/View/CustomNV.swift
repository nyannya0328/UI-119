//
//  CustomNV.swift
//  UI-119
//
//  Created by にゃんにゃん丸 on 2021/02/05.
//

import SwiftUI

struct CustomNV: UIViewControllerRepresentable {
    func makeCoordinator() -> Coordinator {
        
        return CustomNV.Coordinator(parent: self)
        
    }
    let view : AnyView
    
    var onsearch : (String) -> ()
    var oncancell : ()->()
    let largetitle : Bool
    var title : String
    var placefolder : String
    
    init(view:AnyView,placefolder:String? = "Search",largetitle:Bool? = true,title : String?, onsearch:@escaping (String)->(),oncancell:@escaping()->()) {
        self.view = view
        self.onsearch = onsearch
        self.oncancell = oncancell
        self.largetitle = largetitle!
        self.title = title!
        self.placefolder = placefolder!
        
    }
    
    
    func makeUIViewController(context: Context) -> UINavigationController {
        
        let childview = UIHostingController(rootView: view)
        let Contoroller = UINavigationController(rootViewController: childview)
        
        Contoroller.navigationBar.topItem?.title = title
        Contoroller.navigationBar.prefersLargeTitles = largetitle
        
        let SearchController = UISearchController()
        SearchController.searchBar.placeholder = placefolder
        SearchController.obscuresBackgroundDuringPresentation = false
        SearchController.searchBar.delegate = context.coordinator
        
        Contoroller.navigationBar.topItem?.searchController = SearchController
        Contoroller.navigationBar.topItem?.hidesSearchBarWhenScrolling = false
    
        
        
        return Contoroller
        
    }
    func updateUIViewController(_ uiViewController: UINavigationController, context: Context) {
        
        uiViewController.navigationBar.topItem?.title = title
        uiViewController.navigationBar.topItem?.searchController?.searchBar.placeholder = placefolder
        uiViewController.navigationBar.prefersLargeTitles = largetitle
        
    }
    
    class Coordinator : NSObject, UISearchBarDelegate{
        
        let parent : CustomNV
        
        init(parent : CustomNV) {
            self.parent = parent
        }
        
        func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
            self.parent.onsearch(searchText)
        }
        
        func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
            
            self.parent.oncancell()
            
        }
    }
}

