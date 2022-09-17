//
//  ContentView.swift
//  VideoWallpaper
//
//  Created by Mirhat Rama on 16/11/2021.
//

import SwiftUI
import AVKit
import AVFoundation


struct PlayerView: UIViewRepresentable {
    func updateUIView(_ uiView: UIView, context: UIViewRepresentableContext<PlayerView>) {
    }

    func makeUIView(context: Context) -> UIView {
        return LoopingPlayerUIView(frame: .zero)
    }
}


class LoopingPlayerUIView: UIView {
    private let playerLayer = AVPlayerLayer()
    private var playerLooper: AVPlayerLooper?




    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override init(frame: CGRect) {
        super.init(frame: frame)

        // Load the resource
        let fileUrl = Bundle.main.url(forResource: "ElevatorVideoSplashScreen", withExtension: "mp4")!
        let asset = AVAsset(url: fileUrl)
        let item = AVPlayerItem(asset: asset)

        // Setup the player
        let player = AVQueuePlayer()
        playerLayer.player = player
        playerLayer.videoGravity = .resizeAspectFill
        layer.addSublayer(playerLayer)

        // Create a new player looper with the queue player and template item
        playerLooper = AVPlayerLooper(player: player, templateItem: item)

        // Start the movie
        player.play()
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        playerLayer.frame = bounds
    }
}


struct LookingVideoContentView: View {
    
    @State private var showTestScreen = false

    
    var body: some View {

        
        NavigationView{
            GeometryReader{ geo in
                ZStack {
                    PlayerView()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: geo.size.width, height: geo.size.height+180)
                        .overlay(Color.black.opacity(0.2))
                        .blur(radius: 1)
                    .edgesIgnoringSafeArea(.all)

                    VStack(alignment: .leading){
                        Spacer().frame(maxWidth: 10)

                        NavigationLink(destination: ContentView()) {
                            Button {
                                showTestScreen.toggle()
                            } label: {
                                Text("Get Started")
                                    .font(.title)
                                    .foregroundColor(.white)
                            }
                            .fullScreenCover(isPresented: $showTestScreen) {
                                // Things to do when the screen is dismissed
                            } content: {
                                // Destination screen
                                ContentView()
                            }
                
                        }
                    }.frame(maxHeight: 190)
                }
            }
        }

    }
}

struct LoopingVideoContentViewPreview: PreviewProvider {
    static var previews: some View {
        LookingVideoContentView()
    }
}
