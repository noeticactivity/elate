//
//  HashTagView.swift
//  TestAppSeptember
//
//  Created by Gurinder Singh on 9/17/22.
//

import SwiftUI

struct HashTagView: View {
    var hashTagArray: [String] = ["#Lorem", "#Ipsum", "#dolor", "#consectetur", "#adipiscing", "#elit", "#Nam", "#semper", "#sit", "#amet", "#ut", "#eleifend", "#Cras"]
    
    private var gridItemLayout = [GridItem(.adaptive(minimum: 100))]
    
    var body: some View {
        ScrollView{
            LazyVGrid(columns: gridItemLayout , spacing: 5)  {
                ForEach(hashTagArray, id:\.self) { tag in
                    Text(tag)
                }
            }
            .padding()
            .border(Color.blue)
        }
        .frame(width: UIScreen.main.bounds.size.width)
    }
}
struct HashTagView_Previews: PreviewProvider {
    static var previews: some View {
        HashTagView()
    }
}


