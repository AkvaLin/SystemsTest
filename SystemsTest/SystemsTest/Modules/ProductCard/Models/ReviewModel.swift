//
//  ReviewModel.swift
//  SystemsTest
//
//  Created by Никита Пивоваров on 02.02.2024.
//

import Foundation

struct ReviewModel: Identifiable {
    let id = UUID()
    let name: String
    let stringDate: String
    let rating: Int
    let description: String
}
