//
//  IndexItem.swift
//  tabBar
//
//  Created by Sea Ray on 9/9/2567 BE.
//

//import Foundation
//
//struct IndexItem: Codable {
//    let name: String
//    let value: String
//    let change: String
//    let percentChange: String
//
//
//
//
//}

import SwiftUI

struct IndexItem: Identifiable, Decodable {
    let id = UUID()
    let name: String
    let value: String
    let change: String
    let percentChange: String

    var backgroundColor: Color {
        
        let changeValue = Double(change.replacingOccurrences(of: ",", with: "")) ?? 0
        let percentChangeValue = Double(percentChange.replacingOccurrences(of: "%", with: "")) ?? 0
        
        if changeValue < 0 || percentChangeValue < 0 {
            return Color.red
        } else {
            return Color.green
        }
    }
}

