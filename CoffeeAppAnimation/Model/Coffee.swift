//
//  Coffee.swift
//  CoffeeAppAnimation
//
//  Created by Sergey Lukaschuk on 2022-11-22.
//

import SwiftUI

struct Coffee: Identifiable {
    var id: UUID = .init()
    var imageName: String
    var title: String
    var price: String

    static let all: [Coffee] = [
        .init(imageName: "1", title: "Caramel\nCold Drink", price: "$3.90"),
        .init(imageName: "2", title: "Caramel\nMacchiato", price: "$2.30"),
        .init(imageName: "3", title: "Iced Coffee\nMocha", price: "$9.20"),
        .init(imageName: "4", title: "Toffee Nut\nCrunch Latte", price: "$12.30"),
        .init(imageName: "5", title: "Styled Cold\nCoffee", price: "$8.90"),
        .init(imageName: "6", title: "Classic Irish\nCoffee", price: "$6.10"),
        .init(imageName: "7", title: "Black Tea\nLatte", price: "$2.20"),
        .init(imageName: "8", title: "Iced Coffee\nMocha", price: "$5.90"),
    ]
}
