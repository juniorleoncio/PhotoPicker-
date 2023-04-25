//
//  ContentView.swift
//  PhotoPicker
//
//  Created by junior leoncio on 25/04/23.
//

import SwiftUI

struct ContentView: View {
    @State private var isShowingPhotoPicker = false
    @State private var avatarImage = UIImage(named: "default-avatar")!
    var body: some View {
        VStack {
            Text("Profile")
                .font(.title).bold()
            Image(uiImage: avatarImage )
                .resizable()
                .scaledToFill()
                .frame(width: 150, height: 150)
                .clipShape(Circle())
                .padding()
                .onTapGesture {
                    isShowingPhotoPicker = true
                }
            
            Spacer()
                
        }
        .sheet(isPresented: $isShowingPhotoPicker) {
            PhotoPicker(avatarImage: $avatarImage)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
