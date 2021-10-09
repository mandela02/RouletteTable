//
//  PieSlideView.swift
//  Roulette
//
//  Created by TriBQ on 09/10/2021.
//

import SwiftUI

struct PieSlideView: View {
    var center: CGPoint
    var radius: CGFloat
    var startDegree: Double
    var endDegree: Double
    var isSelected: Bool
    var accentColor: Color
    var separatorColor: Color
    
    var path: Path {
        var path = Path()
        path.addArc(center: center,
                    radius: radius,
                    startAngle: Angle(degrees: startDegree),
                    endAngle: Angle(degrees: endDegree),
                    clockwise: false)
        path.addLine(to: center)
        path.closeSubpath()
        return path
    }
    
    var body: some View {
        path
            .fill(accentColor)
            .overlay (
                Group {
                    if isSelected {
                        path
                            .fill(Color.black.opacity(0.5))
                    } else {
                        Color.clear
                    }
                }
            )
            .overlay(path.stroke(separatorColor, lineWidth: 2))
    }
}
