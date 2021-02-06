//
//  item.swift
//  UI-119
//
//  Created by にゃんにゃん丸 on 2021/02/05.
//

import SwiftUI

struct item: Identifiable {
    var id = UUID().uuidString
    var name : String
    var source : String =  "App"
}

var items = [
    
    item(name: "Girl"),
    
    item(name: "Nature"),
    
    item(name: "Night"),
    
    item(name: "Tokyo"),
    
    item(name: "プレイ"),
    item(name: "東京タワー")

]

