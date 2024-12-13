//
//  ContentView.swift
//  task-5
//
//  Created by kamaz on 12.12.2024.
//

import SwiftUI



struct ContentView: View {
    
    private let backgroundColors: [Color] = [.black, .white, .black, .white]
    private let colors: [Color] = [.white, .pink, .yellow, .black]
    
    var screenBounds: CGRect {
        return UIScreen.main.bounds
    }
    
    var body: some View {
        
        ZStack {
            VStack(spacing: 0) {
                ForEach(0..<backgroundColors.count) {
                    Rectangle()
                        .fill(backgroundColors[$0])
                }
            }
            
            VStack(spacing: 0) {
                ForEach(0..<colors.count) {
                    Rectangle()
                        .fill(colors[$0])
                }
            }
            .overlay {
                DragView()
            }
            .compositingGroup()
            
            
        }
        .ignoresSafeArea(.all, edges: .all)
    }
}

#Preview {
    ContentView()
}


struct DragView: View {
    @State private var isDragging = false
    @State private var cuurrentOffsetX: CGFloat = 0
    @State private var currentOffsetY: CGFloat = 0
    
    private var dragGesture: some Gesture {
        DragGesture()
            .onChanged { value in
                cuurrentOffsetX = value.translation.width
                currentOffsetY = value.translation.height
                self.isDragging = true
            }
        
    }
    
    var body: some View {
        RoundedRectangle(cornerRadius: 10)
            .blendMode(.destinationOut)
            .frame(width: 100, height: 100)
            .offset(x: cuurrentOffsetX, y: currentOffsetY)
            .gesture(dragGesture)
    }
}
