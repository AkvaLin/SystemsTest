//
//  DottedSpacer.swift
//  SystemsTest
//
//  Created by Никита Пивоваров on 02.02.2024.
//

import SwiftUI

struct DottedSpacer: View {
    var body: some View {
        GeometryReader { geometry in
            Path { path in
                path.move(to: CGPoint(x: 0, y: 0))
                path.addLine(to: CGPoint(x: geometry.size.width, y: 0))
            }
            .stroke(style: StrokeStyle(lineWidth: 1, dash: [1, 4]))
            .fill(Color.secondary)
        }
        .frame(height: 1)
    }
}

#Preview {
    DottedSpacer()
}
