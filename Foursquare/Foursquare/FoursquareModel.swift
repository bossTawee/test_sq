//
//  FoursquareModel.swift
//  Foursquare
//
//  Created by iMac 2017 21.5" Retina 4K on 3/1/2563 BE.
//  Copyright © 2563 iMac 2017 21.5" Retina 4K. All rights reserved.
//

import Foundation

struct responseInfo: Decodable {
    var response: responsePlace
    
}
struct responsePlace: Decodable {
    var headerFullLocation: String
    var groups: [group]
}

struct group: Decodable {
    var type: String
    var name: String
    var items: [itemData]
    
}
struct itemData: Decodable {
    var venue: venueData
}
struct venueData: Decodable {
    var id: String
    var name: String
    var location: locationData
    var categories: [categoryData]
}
struct locationData: Decodable {
    var formattedAddress: [String]
   
}
struct categoryData: Decodable {
    var icon: iconData
}
struct iconData: Decodable {
    var prefix: String
    var suffix: String
}



