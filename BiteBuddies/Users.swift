//
//  Users.swift
//  BiteBuddies
//
//  Created by Marielle Baumgartner on 2/18/23.
//

import Foundation
import SwiftUI

struct Pastas: Hashable, Codable {
    var name: String
    var description: String
    
    private var imageName: String
        var image: Image {
            Image(imageName)
        }
    private var coordinates: Coordinates

    struct Coordinates: Hashable, Codable {
        var name: String
    }
}
