//
//  ContentView.swift
//  Roulette
//
//  Created by TriBQ on 08/10/2021.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            Color.white
                .ignoresSafeArea()
            
            GeometryReader { proxy in
                VStack {
                    Spacer()
                    ZStack(alignment: .top) {
                        PieView()
                            .frame(width: proxy.size.width - 20,
                                   height: proxy.size.width - 20)
                            .padding(.all, 10)
                            .background(Color.white)
                            .clipShape(Circle())
                            .shadow(color: Color.black.opacity(0.5),
                                    radius: 3)
                        triangle
                    }
                    
                    Spacer()
                }
            }
            .padding(20)

        }
    }
    
    var triangle: some View {
        let triangleWidth: CGFloat = 40
        
        return ZStack {
            Triangle(width: triangleWidth,
                     height: hypotenuse(triangleWidth, triangleWidth / 2),
                     radius: 3)
                .fill(Color.white)
                .shadow(color: Color.black.opacity(0.5), radius: 3)

            Triangle(width: triangleWidth,
                     height: hypotenuse(triangleWidth, triangleWidth / 2),
                     radius: 3)
                .stroke(Color.gray, style: StrokeStyle(lineWidth: 3,
                                                       lineCap: .round,
                                                       lineJoin: .round))
        }
        .frame(width: triangleWidth, height: triangleWidth)
        .rotationEffect(.degrees(180))
        .offset(x: -triangleWidth/2, y: -triangleWidth/2 - 10)
    }
    
    func hypotenuse(_ a: Double, _ b: Double) -> Double {
        return (a * a + b * b).squareRoot()
    }
}
