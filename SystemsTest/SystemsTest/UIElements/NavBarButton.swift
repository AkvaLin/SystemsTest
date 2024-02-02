//
//  NavBarButton.swift
//  SystemsTest
//
//  Created by Никита Пивоваров on 01.02.2024.
//

import SwiftUI

struct NavBarButton: View {
    
    private let title: String
    
    init(title: String) {
        self.title = title
    }
    
    var body: some View {
        Button {
            
        } label: {
            Image(systemName: title)
                .font(.headline)
        }
    }
}

#Preview {
    NavBarButton(title: "Button")
}
