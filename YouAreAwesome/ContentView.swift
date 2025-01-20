//
//  ContentView.swift
//  YouAreAwesome
//
//  Created by Faik Emre Kadısoyu on 8.01.2025.
//

import SwiftUI
import AVFAudio

// Verion 1.4

struct ContentView: View {
    @State private var message = ""
    @State private var imageName = ""
    @State private var soundName = ""
  
    @State private var lastMessageNumber = -1
    @State private var lastImageNumber = -1
    @State private var lastSoundNumber = -1
    
    let numberOfImages = 9
    let numberOfSounds = 6
    
    @State private var audioPlayer: AVAudioPlayer!
    
    var body: some View {
        
        VStack {
            Text(message)
                .font(.largeTitle)
                .fontWeight(.heavy)
                .foregroundStyle(.red)
                .multilineTextAlignment(.center)
                .minimumScaleFactor(0.5)
                .frame(height: 100)
                .animation(.easeInOut(duration: 0.15), value: message)
            
            Spacer()
            
            Image(imageName)
                .resizable()
                .scaledToFit()
                .clipShape(RoundedRectangle(cornerRadius: 30))
                .shadow(radius: 30)
                .animation(.default, value: imageName)
            
            Spacer()
            
            Button("Show Message") {
                let messages = ["You Are Awesome!",
                                "When the Genius Bar Needs Help, Yhey Call You!",
                                "You Are Great!",
                                "You Are Fantastic!",
                                "Fabulous? That!s You!"]
                
                // repat/while method
                var messageNumber: Int
                repeat {
                    messageNumber = Int.random(in: 0..<messages.count)
                } while messageNumber == lastMessageNumber
                   
                message = messages[messageNumber]
                lastMessageNumber = messageNumber
                
                // while method
                var imageNumber = Int.random(in: 0...numberOfImages - 1)
                while imageNumber == lastImageNumber {
                    imageNumber = Int.random(in: 0..<9)
                }
                imageName = "image\(imageNumber)"
                lastImageNumber = imageNumber
                
                
                
                
               var soundNumber: Int
                repeat {
                    soundNumber = Int.random(in: 0...numberOfSounds - 1)
                } while soundNumber == lastSoundNumber
                
                soundName = "sound\(soundNumber)"
                lastSoundNumber = soundNumber
                
                
                guard let soundFile = NSDataAsset(name: soundName) else {
                    print("😡 Could not read file named")
                    return
                }
                
                do {
                    audioPlayer = try AVAudioPlayer(data: soundFile.data)
                    audioPlayer.play()
                } catch {
                    print("😡 ERROR: \(error.localizedDescription) creating audioPlayer.")
                }
               
                
                
            }
            .buttonStyle(.borderedProminent)
            .font(.title2)
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
