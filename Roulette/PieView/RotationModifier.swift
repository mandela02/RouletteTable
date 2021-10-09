//
//  RotationModifier.swift
//  Roulette
//
//  Created by TriBQ on 09/10/2021.
//

import SwiftUI

struct RotationModifier: AnimatableModifier {
    var totalDegree: CGFloat
    
    var destination: CGFloat
    var onRotationEnd: () -> Void = {}
    
    var animatableData: Double {
        get { destination }
        set {
            destination = newValue
            checkIfFinished()
        }
    }
    
    func checkIfFinished() {
      if destination == totalDegree {
        DispatchQueue.main.async {
          self.onRotationEnd()
        }
      }
    }
    
    func body(content: Content) -> some View {
        content
            .rotationEffect(.degrees(destination))
    }
}
