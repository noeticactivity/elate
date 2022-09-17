//
//  Stylesheet.swift
//  TestAppSeptember
//
//  Created by Gurinder Singh on 9/17/22.
//

import Foundation
import SwiftUI

extension Image {
    func profileImageStyle() -> some View {
        self.resizable()
            .aspectRatio(contentMode: .fit)
            .frame(width: 150, height: 150)
            .clipShape(Circle())
            .clipped()
            .overlay() {
                ZStack {
                    Image(systemName: "camera.fill")
                        .foregroundColor(.gray)
                        .offset(y: 60)
                    
                    RoundedRectangle(cornerRadius: 100)
                        .stroke(.white, lineWidth: 4)
                }
            }
    }
}

struct Previews_Stylesheet_Previews: PreviewProvider {
    static var previews: some View {
        /*@START_MENU_TOKEN@*/Text("Hello, World!")/*@END_MENU_TOKEN@*/
    }
}
