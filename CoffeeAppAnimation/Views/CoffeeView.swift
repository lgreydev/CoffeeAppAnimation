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
        GeometryReader { proxy in
           let size = proxy.size

            Image(coffee.imageName)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: size.width, height: size.height)
        }
        .frame(height: size.width)
    }
}



//struct CoffeeView_Previews: PreviewProvider {
//    static var previews: some View {
//        CoffeeView()
//    }
//}
