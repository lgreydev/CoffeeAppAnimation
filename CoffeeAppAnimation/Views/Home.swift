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
            let cardSize = size.width * 0.8

            HeaderView(items: coffees, index: currentIndex)

            LinearGradient(colors: [
                .clear,
                Color.brown.opacity(0.2),
                Color.brown.opacity(0.45),
                Color.brown
            ], startPoint: .top, endPoint: .bottom)
            .frame(height: 300)
            .frame(maxHeight: .infinity, alignment: .bottom)
            .ignoresSafeArea()

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








struct Home_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
