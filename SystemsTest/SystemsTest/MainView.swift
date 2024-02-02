//
//  MainView.swift
//  SystemsTest
//
//  Created by Никита Пивоваров on 02.02.2024.
//

import SwiftUI

struct MainView: View {
    var body: some View {
        TabView {
            ProductCardView(model: ProductModel(rating: 4.1,
                                                image: "linden",
                                                title: "Добавка \"Липа\"\nк чаю 200 г",
                                                region: "Испания, Риоха",
                                                flag: "spain",
                                                description: "Флавоноиды липового цвета обладают противовоспалительным действием, способствуют укреплению стенки сосудов.",
                                                specifications: [
                                                    SpecificationModel(title: "Производство",
                                                                       value: "Россия, Краснодарский край"),
                                                    SpecificationModel(title: "Энергетическая ценность, ккал/100г",
                                                                       value: "25 ккал, 105 кДж"),
                                                    SpecificationModel(title: "Жиры/100г",
                                                                       value: "0,1 г"),
                                                    SpecificationModel(title: "Белки/100г",
                                                                       value: "1,3 г"),
                                                    SpecificationModel(title: "Углеводы/100г", value: "3,3 г"),
                                                    SpecificationModel(title: "Масса",
                                                                       value: "200 г")
                                                ],
                                                reviews: Array(repeating: ReviewModel(name: "Александр В.",
                                                                                      stringDate: "7 мая 2021",
                                                                                      rating: 4,
                                                                                      description: "Хорошая добавка, мне очень понравилась! Хочу, чтобы все добавки были такими!"),
                                                               count: 152),
                                                price: 199,
                                                discountPercentage: 5,
                                                finalPrice: 55.9))
            .tabItem {
                Label("Главная", systemImage: "tree.circle")
            }
            ContentView()
                .tabItem {
                    Label("Каталог", systemImage: "square.grid.2x2")
                }
            ContentView()
                .tabItem {
                    Label("Корзина", systemImage: "cart")
                }
            ContentView()
                .tabItem {
                    Label("Профиль", systemImage: "person")
                }
        }
        .accentColor(.green)
    }
}

#Preview {
    MainView()
}
