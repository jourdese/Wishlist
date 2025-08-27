//
//  WishModel.swift
//  Wishlist
//
//  Created by Jourdese Palacio on 8/27/25.
//

import Foundation
import SwiftData

@Model
class Wish {
    var title: String
    
    init(title: String) {
        self.title = title
    }
}
