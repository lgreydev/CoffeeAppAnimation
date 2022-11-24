//
//  Home.swift
//  CoffeeAppAnimation
//
//  Created by Sergey Lukaschuk on 2022-11-23.
//

import SwiftUI

struct Home: View {
    var body: some View {
        GeometryReader {
            let size = $0.size

            VStack(spacing: 0) {
                ForEach(Coffee.all) { coffee in
                    CoffeeView(coffee: coffee, size: size)
                }
            }
        }
        .preferredColorScheme(.light)
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


