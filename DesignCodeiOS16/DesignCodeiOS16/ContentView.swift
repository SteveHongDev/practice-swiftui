
//  ContentView.swift
//  DesignCodeiOS16
//
//  Created by Steve Hong on 2023/03/30.
//

import SwiftUI

struct ContentView: View {
    @State private var showMenu = false
    @AppStorage("selectedMenu") var selectedMenu: Menu = .compass
    @GestureState private var press = false
    
    var longPress: some Gesture {
        LongPressGesture(minimumDuration: 1)
            .updating($press) { currentState, gestureState, transaction in
                gestureState = currentState
            }
            .onEnded { value in
                showMenu = true
            }
    }
    
    var body: some View {
        ZStack {
            Color(.systemBackground).ignoresSafeArea()
            
            switch selectedMenu {
            case .compass:
                CompassView()
            case .card:
                CardReflectionView()
            case .charts:
                DetailView()
            case .radial:
                RadialLayoutView()
            case .halfsheet:
                MenuView()
            case .gooey:
                Text("Gooey")
            case .actionbutton:
                ActionButtonView()
            }
            
        }
        .overlay(MessageView())
        .onTapGesture {
            
        }
        .gesture(longPress)
        .sheet(isPresented: $showMenu) {
            MenuView()
                .presentationDetents([.medium, .large])
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
