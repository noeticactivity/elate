//
//  ARContentView.swift
//  Elate
//
//  Created by Gurinder Singh on 9/17/22.
//

import SwiftUI
import RealityKit

struct ARContentView : View {
    var body: some View {
        ARViewContainer().edgesIgnoringSafeArea(.all)
    }
}

struct ARViewContainer: UIViewRepresentable {
    
    func makeUIView(context: Context) -> ARView {
        
        let arView = ARView(frame: .zero)
        
        // Load the "Box" scene from the "Experience" Reality File
//        let boxAnchor = try! Experience.loadBox()
//        let boxAnchor = try! Test2.loadScene()
        let boxAnchor = try! User2.loadScene()
        
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
