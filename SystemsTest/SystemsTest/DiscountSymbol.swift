//
//  DiscountSymbol.swift
//  SystemsTest
//
//  Created by Никита Пивоваров on 02.02.2024.
//

import SwiftUI

struct DiscountSymbol: View {
    var body: some View {
        GeometryReader { geo in
            Path { path in
                let width = geo.size.width
                let height = geo.size.height
                let spacing = width * 0.1
                
                path.addLines([
                    CGPoint(x: 0, y: spacing),
                    CGPoint(x: 0, y: height - spacing * 1.25),
                ])
                
                path.addQuadCurve(to: CGPoint(x: width, y: height - spacing / 1.5),
                                  control: CGPoint(x: width / 2, y: height))

                path.addLine(to: CGPoint(x: width - spacing, y: 0))
                
                path.addQuadCurve(to: CGPoint(x: 0, y: spacing),
                                  control: CGPoint(x: width / 2, y: spacing * 2))
            }
            .fill(Color.pink)
        }
    }
}

#Preview {
    DiscountSymbol()
}
