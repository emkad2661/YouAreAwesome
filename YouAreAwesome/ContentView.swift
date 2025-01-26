//
//  ContentView.swift
//  YouAreAwesome
//
//  Created by Faik Emre Kadısoyu on 8.01.2025.
//

import SwiftUI
import AVFAudio

// Verion 1.5

struct ContentView: View {
    @State private var message = ""
    @State private var imageName = ""
    
    @State private var lastMessageNumber = -1 // lastMessageNumber will never be -1
    @State private var lastImageNumber = -1
    @State private var lastSoundNumber = -1
    
    let numberOfImages = 10 // images labeled image0 - image9
    let numberOfSounds = 6  // sounds labeled sound0 - sound5
    
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
                
                
                lastMessageNumber = nonRepeatingRandom(lastNumber: lastMessageNumber, upperBound: messages.count-1)
                message = messages[lastMessageNumber]
                
                lastImageNumber = nonRepeatingRandom(lastNumber: lastImageNumber, upperBound: numberOfImages-1)
                imageName = "image\(lastImageNumber)"
                
                lastSoundNumber = nonRepeatingRandom(lastNumber: lastSoundNumber, upperBound: numberOfSounds-1)
                playSound(soundName: "sound\(lastSoundNumber)")
                
            }
            .buttonStyle(.borderedProminent)
            .font(.title2)
        }
        .padding()
    }
    
    func playSound(soundName: String) {
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
    
    func nonRepeatingRandom (lastNumber: Int, upperBound: Int) -> Int {
        var newNumber: Int
        repeat {
            newNumber = Int.random(in: 0...upperBound)
        } while newNumber == lastNumber
        return newNumber
    }
    
}

#Preview {
    ContentView()
}
