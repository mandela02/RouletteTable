//
//  Triangle.swift
//  Roulette
//
//  Created by TriBQ on 09/10/2021.
//

import SwiftUI

struct Triangle: Shape {
    let width: CGFloat
    let height: CGFloat
    let radius: CGFloat
    
    func path(in rect: CGRect) -> Path {
        let point1 = CGPoint(x: -width / 2, y: height / 2)
        let point2 = CGPoint(x: 0, y: -height / 2)
        let point3 = CGPoint(x: width / 2, y: height / 2)

        var path = Path()
        path.move(to: CGPoint(x: 0, y: height / 2))
        path.addArc(tangent1End: point1, tangent2End: point2, radius: radius)
        path.addArc(tangent1End: point2, tangent2End: point3, radius: radius)
        path.addArc(tangent1End: point3, tangent2End: point1, radius: radius)
        path.closeSubpath()
        
        return path
    }
}
