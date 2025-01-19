//
//  ContentView.swift
//  YouAreAwesome
//
//  Created by Faik Emre Kadısoyu on 8.01.2025.
//

import SwiftUI

// Verion 1.2

struct ContentView: View {
    @State private var message = ""
    @State private var imageName = ""
    @State private var imageNumber = 0
    @State private var messageNumber = 0
    
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
                
                message = messages[Int.random(in: 0..<messages.count)]
                imageName = "image\(Int.random(in: 0..<9))"
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
