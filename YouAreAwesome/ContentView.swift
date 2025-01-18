//
//  ContentView.swift
//  YouAreAwesome
//
//  Created by Faik Emre Kadısoyu on 8.01.2025.
//

import SwiftUI

// Verion 1.1

struct ContentView: View {
    @State private var message = ""
    @State private var imageName = ""
    @State private var imageNumber = 0
    @State private var messageNumber = 0
    
    var body: some View {
        
        VStack {
            
            Spacer()
            
            Image(imageName)
                .resizable()
                .scaledToFit()
                .clipShape(RoundedRectangle(cornerRadius: 30))
                .shadow(radius: 30)
            
            Text(message)
                .font(.largeTitle)
                .fontWeight(.heavy)
                .foregroundStyle(.red)
                .multilineTextAlignment(.center)
            
            
            Spacer()
            
            Button("Show Message") {
                
                let messages = ["You Are Awesome!",
                                "You Are Great!",
                                "You Are Fantastic!",
                                "Fabulous? That!s You!",
                                "When the Genius Bar Needs Help, Yhey Call You!"]
                
                message = messages[messageNumber]
                messageNumber += 1
                if messageNumber > messages.count - 1 {
                    messageNumber = 0
                }
                
                
                imageName = "image\(imageNumber)"
                imageNumber += 1
                if imageNumber > 9 {
                    imageNumber = 0
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
