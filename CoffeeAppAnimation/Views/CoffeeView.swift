//
//  CoffeeView.swift
//  CoffeeAppAnimation
//
//  Created by Sergey Lukaschuk on 2022-11-23.
//

import SwiftUI

struct CoffeeView: View {

    var coffee: Coffee
    var size: CGSize

    var body: some View {
        let cardSize = size.width * 0.9
        let maxCardsDisplaySize = size.width * 4

        GeometryReader { proxy in
            let _size = proxy.size
            let offset = proxy.frame(in: .named("SCROLL")).minY - (size.height - cardSize)
            let scale = offset <= 0 ? (offset / maxCardsDisplaySize) : 0
            let reducedScale = 1 + scale
            let currentCardScale = offset / cardSize

            Image(coffee.imageName)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: _size.width, height: _size.height)
                .scaleEffect(reducedScale < 0 ? 0.001 : reducedScale, anchor: .init(x: 0.5, y: 1 - (currentCardScale / 2)))
                .scaleEffect(offset > 0 ? 1 + currentCardScale : 1, anchor: .top)
                .offset(y: offset > 0 ? currentCardScale * 200 : 0)
                .offset(y: currentCardScale * -130)
        }
        .frame(height: cardSize)
    }
}
