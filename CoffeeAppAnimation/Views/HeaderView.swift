//
//  HeaderView.swift
//  CoffeeAppAnimation
//
//  Created by Sergey Lukaschuk on 2022-11-28.
//

import SwiftUI

struct HeaderView: View {

    private let coffees: [Coffee]
    private let index: CGFloat

    init(items coffees: [Coffee], index currentIndex: CGFloat) {
        self.coffees = coffees
        self.index = currentIndex
    }

    var body: some View {
        VStack {
            HStack {
                Button {} label: {
                    Image(systemName: "chevron.left")
                        .font(.title.bold())
                        .foregroundColor(.black)
                }

                Spacer()

                Button {} label: {
                    Image(systemName: "cart.fill")
                        .resizable()
                        .renderingMode(.template)
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 30, height: 30)
                        .foregroundColor(.black)
                }
            }

            GeometryReader {
                let size = $0.size

                HStack(spacing: 0) {
                    ForEach(coffees) { coffee in
                        VStack(spacing: 15) {
                            Text(coffee.title)
                                .font(.title.bold())
                                .multilineTextAlignment(.center)

                            Text(coffee.price)
                                .font(.title)
                        }
                        .frame(width: size.width)
                    }
                }
                .offset(x: index * -size.width)
                .animation(.interactiveSpring(
                    response: 0.6,
                    dampingFraction: 0.8,
                    blendDuration: 0.8), value: index)
            }
            .padding(.top, 10)
        }
        .padding(25)
    }
}
