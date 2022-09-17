//
//  MainView.swift
//  TestAppSeptember
//
//  Created by Gurinder Singh on 9/17/22.
//

import SwiftUI

struct VanillaView: View {
    var body: some View {
        Image("Screen1")
            .resizable()
    }
}

struct MainView: View {
    var body: some View {
        TabView {
            VanillaView()
                .tabItem {
                    Label("Menu", systemImage: "list.dash")
                }

            ARContentView()
                .tabItem {
                    Label("Explorer", systemImage: "square.and.pencil")
                }
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
