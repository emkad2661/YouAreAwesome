//
//  ContentView.swift
//  YouAreAwesome
//
//  Created by Faik Emre Kadısoyu on 8.01.2025.
//

import SwiftUI

// Verion 1.0

struct ContentView: View {
    @State private var message = ""
    @State private var imageName = ""
    @State private var imageNumber = 0
    
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
            
            Spacer()
            
            Button("Show Message") {
                let message1 = "You Are Aewsome!"
                let message2 = "You Are Great!"
                
                message = ( message == message1 ? message2 : message1)
                
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
