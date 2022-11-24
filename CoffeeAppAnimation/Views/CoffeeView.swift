//
//  CoffeeView.swift
//  CoffeeAppAnimation
//
//  Created by Sergey Lukaschuk on 2022-11-23.
//

import SwiftUI

struct CoffeeView: View {

    var coffees = Coffee.all
    var size = CGSize()

    var body: some View {
        GeometryReader { proxy in
           let size = proxy.size
        }
    }
}



struct CoffeeView_Previews: PreviewProvider {
    static var previews: some View {
        CoffeeView()
    }
}
