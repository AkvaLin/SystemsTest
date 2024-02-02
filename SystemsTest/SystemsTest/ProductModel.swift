//
//  ProductModel.swift
//  SystemsTest
//
//  Created by Никита Пивоваров on 02.02.2024.
//

import Foundation
import SwiftUI

struct ProductModel {
    let rating: Float
    let image: String
    let title: String
    let region: String
    let flag: String
    let description: String
    let specifications: [SpecificationModel]
    let reviews: [ReviewModel]
    let price: Float
    let discountPercentage: Int
    let finalPrice: Float
}
