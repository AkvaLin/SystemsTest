//
//  ProductCardView.swift
//  SystemsTest
//
//  Created by Никита Пивоваров on 01.02.2024.
//

import SwiftUI

struct ProductCardView: View {
    
    private let model: ProductModel
    
    init(model: ProductModel) {
        self.model = model
    }
    
    @State private var showAllSpecs = false
    @State private var selectedMethod: Method = .pc
    
    var body: some View {
        VStack(spacing: 0) {
            NavigationView {
                ScrollView {
                    VStack {
                        VStack {
                            Text("Цена по карте")
                                .font(.caption)
                                .foregroundColor(.white)
                                .padding(5)
                                .background(Color.green)
                                .cornerRadius(5)
                                .frame(maxWidth: .infinity, alignment: .leading)
                            Image(model.image)
                                .resizable()
                                .aspectRatio(1, contentMode: .fill)
                                .cornerRadius(5)
                                .padding(.vertical)
                            HStack {
                                Image(systemName: "star.fill")
                                    .foregroundColor(.yellow)
                                Text(String(format: "%.1f", model.rating))
                                    .font(.headline)
                                Divider()
                                Text("\(model.reviews.count) отзывов")
                                    .foregroundColor(.secondary)
                                GeometryReader { geo in
                                    HStack {
                                        Spacer()
                                        DiscountSymbol()
                                            .frame(maxWidth: geo.size.width / 4.6, alignment: .trailing)
                                            .aspectRatio(6.5, contentMode: .fill)
                                            .overlay (
                                                Text("-\(model.discountPercentage)%")
                                                    .scaleEffect(0.8, anchor: .center)
                                                    .foregroundColor(.white)
                                            )
                                    }
                                }
                            }
                            Text(model.title)
                                .font(.system(size: 34).weight(.bold))
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .padding(.vertical)
                            HStack {
                                Image(model.flag)
                                    .resizable()
                                    .clipShape(.circle)
                                    .scaledToFit()
                                Text(model.region)
                                Spacer()
                            }
                            .frame(maxWidth: .infinity, maxHeight: 30)
                            .padding(.bottom)
                            Group {
                                Text("Описание")
                                    .font(.system(size: 17).weight(.semibold))
                                Text(model.description)
                                    .padding(.top, 2)
                                Text("Основные характеристики")
                                    .font(.system(size: 17).weight(.semibold))
                                    .padding(.top)
                            }
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding(.bottom, 2)
                            ForEach(model.specifications[showAllSpecs ? 0...model.specifications.count-1 : 0...4]) { spec in
                                HStack {
                                    Text(spec.title)
                                        .multilineTextAlignment(.leading)
                                        .layoutPriority(1)
                                    DottedSpacer()
                                    Text(spec.value)
                                        .multilineTextAlignment(.trailing)
                                        .layoutPriority(1)
                                }
                            }
                            HStack {
                                Button {
                                    withAnimation {
                                        showAllSpecs.toggle()
                                    }
                                } label: {
                                    Text(showAllSpecs ? "Свернуть" : "Все характеристики")
                                        .font(.system(size: 17).weight(.bold))
                                }
                                Spacer()
                            }
                            .padding(.top, 2)
                            HStack(alignment: .bottom) {
                                Text("Отзывы")
                                    .font(.system(size: 25).weight(.semibold))
                                Spacer()
                                Button {
                                    
                                } label: {
                                    Text("Все \(model.reviews.count)")
                                        .font(.system(size: 17).weight(.bold))
                                }
                            }
                            .padding(.top)
                        }
                        .padding([.top, .horizontal])
                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack(spacing: 10) {
                                ForEach(model.reviews[0..<5]) { review in
                                    VStack {
                                        Group {
                                            Text(review.name)
                                                .font(.system(size: 17).weight(.bold))
                                            Group {
                                                Text(review.stringDate)
                                                    .foregroundColor(.secondary)
                                                HStack(spacing: 5) {
                                                    ForEach(0..<review.rating) { _ in
                                                        Image(systemName: "star.fill")
                                                            .foregroundColor(.yellow)
                                                    }
                                                    ForEach(review.rating..<5) { _ in
                                                        Image(systemName: "star.fill")
                                                            .foregroundColor(.secondary)
                                                    }
                                                }
                                                .padding(.vertical, 2)
                                                Text(review.description)
                                            }
                                            .font(.system(size: 14))
                                        }
                                        .frame(maxWidth: .infinity, alignment: .leading)
                                    }
                                    .padding(8)
                                    .frame(width: 245, height: 145)
                                    .background(
                                        RoundedRectangle(cornerRadius: 12)
                                            .fill(Color.white)
                                            .shadow(radius: 6)
                                    )
                                    .padding([.leading, .vertical])
                                }
                            }
                        }
                        .padding(.bottom, 2)
                        Button {
                            
                        } label: {
                            Text("Оставить отзыв")
                                .font(.system(size: 17).weight(.bold))
                                .frame(maxWidth: .infinity, alignment: .center)
                                .padding(12)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 25)
                                        .stroke(.green, lineWidth: 3)
                                )
                        }
                        
                        .padding([.horizontal, .bottom])
                    }
                }
                .toolbar {
                    ToolbarItem(placement: .navigation) {
                        NavBarButton(title: "arrow.left")
                    }
                    ToolbarItem {
                        NavBarButton(title: "list.bullet.rectangle.portrait")
                    }
                    ToolbarItem {
                        NavBarButton(title: "square.and.arrow.up")
                    }
                    ToolbarItem {
                        NavBarButton(title: "heart")
                    }
                }
            }
            Divider()
            VStack {
                Picker("", selection: $selectedMethod) {
                    Text("Шт").tag(Method.pc)
                    Text("Кг").tag(Method.kg)
                }
                .pickerStyle(.segmented)
                .padding(.top, 8)
                HStack {
                    if model.discountPercentage == 0 {
                        Text(String(format: "%.1f", model.price))
                            .font(.system(size: 34).weight(.bold))
                    } else {
                        VStack {
                            Text(String(format: "%.1f", model.finalPrice))
                                .font(.system(size: 32).weight(.bold))
                            Text(String(format: "%.1f", model.price))
                                .font(.system(size: 14))
                                .foregroundColor(.secondary)
                                .strikethrough()
                        }
                    }
                    ZStack {
                        Group {
                            Image(systemName: "rublesign")
                                .offset(x: -5, y: -8)
                            Image(systemName: "line.diagonal")
                            Text("кг")
                                .offset(x: 5, y: 8)
                        }
                        .font(.system(size: 10).weight(.bold))
                    }
                    .offset(y: -6)
                    Spacer()
                    HStack {
                        Button {
                            
                        } label: {
                            Image(systemName: "minus")
                                .frame(width: 44, height: 44, alignment: .center)
                                .contentShape(Rectangle())
                        }
                        VStack {
                            Text("1 шт")
                                .font(.system(size: 17).weight(.bold))
                            HStack(spacing: 0) {
                                Text(String(format: "%.1f", 120.0))
                                Image(systemName: "rublesign")
                            }
                            .font(.system(size: 14))
                        }
                        Button {
                            
                        } label: {
                            Image(systemName: "plus")
                                .frame(width: 44, height: 44, alignment: .center)
                                .contentShape(Rectangle())
                        }
                    }
                    .padding(.vertical, 4)
                    .foregroundColor(.white)
                    .background(
                        Capsule()
                            .fill(Color.green)
                    )
                }
                .padding(.bottom)
                .padding(.top, 8)
            }
            .padding(.horizontal)
        }
    }
}


