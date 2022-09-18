//
//  ARContentView.swift
//  Elate
//
//  Created by Gurinder Singh on 9/17/22.
//

import SwiftUI
import RealityKit

struct ARContentView : View {
    @State var showSecondView = false

    var body: some View {
        Group {
            if showSecondView {
                CoffeeOfferView()
            } else {
                ARViewContainer().edgesIgnoringSafeArea(.all)
            }
        }
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 15) {
                self.showSecondView = true
            }
        }
    }
}

struct ARViewContainer: UIViewRepresentable {
    
    func makeUIView(context: Context) -> ARView {
        
        let arView = ARView(frame: .zero)
        
        // Load the "Box" scene from the "Experience" Reality File
//        let boxAnchor = try! Experience.loadBox()
//        let boxAnchor = try! Test2.loadScene()
        let boxAnchor = try! FinalUser.loadScene()
        
        // Add the box anchor to the scene
        arView.scene.anchors.append(boxAnchor)
        
        return arView
        
    }
    
    func updateUIView(_ uiView: ARView, context: Context) {}
    
}

#if DEBUG
struct ARContentView_Previews : PreviewProvider {
    static var previews: some View {
        ARContentView()
    }
}
#endif
