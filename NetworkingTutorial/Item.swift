//
//  Item.swift
//  NetworkingTutorial
//
//  Created by Dongjun Lee on 3/18/24.
//

import Foundation
import SwiftData

@Model
final class Item {
    var timestamp: Date
    
    init(timestamp: Date) {
        self.timestamp = timestamp
    }
}
