//
//  ContentView.swift
//  YouAreAwesome
//
//  Created by Faik Emre Kadısoyu on 8.01.2025.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        
        VStack {
            Image(systemName: "swift")
                .resizable()
                .scaledToFit()
                .foregroundStyle(.orange)
           
          Text("I'm an app developer!")
                .font(.largeTitle)
                .fontWeight(.heavy)
                .foregroundStyle(.red)
            
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
