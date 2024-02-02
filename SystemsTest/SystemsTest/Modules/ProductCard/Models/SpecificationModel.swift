//
//  SpecificationModel.swift
//  SystemsTest
//
//  Created by Никита Пивоваров on 02.02.2024.
//

import Foundation

struct SpecificationModel: Identifiable {
    let id = UUID()
    let title: String
    let value: String
}
