//
//  Home.swift
//  CoffeeAppAnimation
//
//  Created by Sergey Lukaschuk on 2022-11-23.
//

import SwiftUI

struct Home: View {
    @State var offsetY: CGFloat = 0
    @State var currentIndex: CGFloat = 0

    private var coffees = Coffee.all

    var body: some View {
        GeometryReader {
            let size = $0.size
            let cardSize = size.width

            VStack(spacing: 0) {
                ForEach(coffees) { coffee in
                    CoffeeView(coffee: coffee, size: size)
                }
            }
            .frame(width: size.width)
            .padding(.top, size.height - cardSize)
            .offset(y: offsetY)
            .offset(y: -currentIndex * cardSize)
        }
        .coordinateSpace(name: "SCROLL")
        .containerShape(Rectangle())
        .gesture(
            DragGesture()
                .onChanged { value in
                    offsetY = value.translation.height * 0.7
                }
                .onEnded { value in
                    let translation = value.translation.height

                    withAnimation(.easeInOut) {
                        if translation > 0 {
                            if currentIndex > 0 && translation > 250 {
                                currentIndex -= 1
                            }
                        } else {
                            if currentIndex < CGFloat(coffees.count - 1) && -translation > 250 {
                                currentIndex += 1
                            }
                        }
                        offsetY = .zero
                    }
                }
        )
        .preferredColorScheme(.light)
    }
}

struct CoffeeView: View {

    var coffee: Coffee
    var size: CGSize

    var body: some View {
        let cardSize = size.width
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

            Text("\(offset)")
        }
        .frame(height: size.width)
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
