//
//  CircleImage.swift
//  Landmarks
//
//  Created by Damián Matysko on 8/6/22.
//

import SwiftUI

struct CircleImage: View {
    var image: Image// = Image("turtlerock")
    
    var body: some View {
        
        Image("turtlerock")
            .resizable()
            .frame(width: 132.0, height: 132.0)
            .clipShape(Circle())
            .overlay {
                Circle().stroke(.white, lineWidth: 4)
            }
            .shadow(radius: 7)
        
    }
}

struct CircleImage_Previews: PreviewProvider {
    static var previews: some View {
        CircleImage(image: Image("turtlerock"))
    }
}
