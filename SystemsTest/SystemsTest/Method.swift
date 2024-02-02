//
//  Method.swift
//  SystemsTest
//
//  Created by Никита Пивоваров on 02.02.2024.
//

import Foundation

enum Method: String, CaseIterable, Identifiable {
    case pc, kg
    var id: Self { self }
}
