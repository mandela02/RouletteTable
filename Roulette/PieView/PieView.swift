//
//  PieView.swift
//  Roulette
//
//  Created by TriBQ on 08/10/2021.
//

import SwiftUI

enum SpecialEffect {
    case hello
}

struct PieView: View {
    let datasource = [PieSlideModel(title: "Eat", color: Color.red),
                      PieSlideModel(title: "Shower", color: Color.blue),
                      PieSlideModel(title: "Game", color: Color.yellow),
                      PieSlideModel(title: "Work", color: Color.green),
                      PieSlideModel(title: "Gundam", color: Color.purple),
                      PieSlideModel(title: "Sleep", color: Color.red),
                      PieSlideModel(title: "Movie", color: Color.blue),
                      PieSlideModel(title: "Go out", color: Color.yellow),
                      PieSlideModel(title: "Work out", color: Color.purple),
                      PieSlideModel(title: "Sleep", color: Color.red),
                      PieSlideModel(title: "Movie", color: Color.blue),
                      PieSlideModel(title: "Go out", color: Color.yellow),
                      PieSlideModel(title: "Work out", color: Color.purple),
                      PieSlideModel(title: "Sleep", color: Color.red),
                      PieSlideModel(title: "Movie", color: Color.blue),
                      PieSlideModel(title: "Go out", color: Color.yellow),
                      PieSlideModel(title: "Work out", color: Color.purple),
                      PieSlideModel(title: "Sleep", color: Color.red),
                      PieSlideModel(title: "Movie", color: Color.blue),
                      PieSlideModel(title: "Go out", color: Color.yellow),
                      PieSlideModel(title: "Work out", color: Color.purple),
                      PieSlideModel(title: "Sleep", color: Color.red),
                      PieSlideModel(title: "Movie", color: Color.blue),
                      PieSlideModel(title: "Go out", color: Color.yellow),
                      PieSlideModel(title: "Work out", color: Color.purple),
                      PieSlideModel(title: "Sleep", color: Color.red),
                      PieSlideModel(title: "Movie", color: Color.blue),
                      PieSlideModel(title: "Go out", color: Color.yellow),
                      PieSlideModel(title: "Work out", color: Color.purple),
                      PieSlideModel(title: "Sleep", color: Color.red),
                      PieSlideModel(title: "Movie", color: Color.blue),
                      PieSlideModel(title: "Go out", color: Color.yellow),
                      PieSlideModel(title: "Work out", color: Color.purple),
                      PieSlideModel(title: "Sleep", color: Color.red),
                      PieSlideModel(title: "Movie", color: Color.blue),
                      PieSlideModel(title: "Go out", color: Color.yellow),
                      PieSlideModel(title: "Work out", color: Color.purple)]
        
    @State
    private var endDegree: Double = 0
    
    @State
    private var result: Int?
    
    private let duration: Double = 4
    
    private let revolution: Double = 4
        
    var body: some View {
        GeometryReader { proxy in
            let radius = proxy.frame(in: .local).width/2
            
            ZStack {
                buildTable()
                    .modifier(RotationModifier(totalDegree: endDegree,
                                               destination: endDegree,
                                               onRotationEnd: {
                        calculateResult()
                    }))
                    .animation(.easeInOut(duration: duration), value: endDegree)
                
                Button(action: {
                    result = nil
                                        
                    let randomNumber = Int.random(in: 0...360)
                    
                    endDegree = endDegree + 360 * revolution + Double(randomNumber)
                },
                       label: {
                    Text("SET")
                        .font(.title.bold())
                })
                    .frame(width: radius / 2, height: radius / 2, alignment: .center)
                    .background(Color.white)
                    .clipShape(Circle())
            }
        }
    }
    
    private func buildTable() -> some View {
        RoletteTable(datasource: datasource, result: result)
    }
    
    private func calculateResult() {
        let minusRevolution = Int(endDegree.rounded(.down))
            .quotientAndRemainder(dividingBy: 360).quotient
        
        let chunk = Double(360) / Double(datasource.count)
        
        let endDegree = 360 - (endDegree - Double(360 * minusRevolution))
        
        let range = datasource.indices.map { index -> (start: Double, end: Double) in
            if index == 0 {
                return (360 - chunk / 2, chunk / 2)
            } else {
                return (chunk / 2 + chunk * Double((index - 1)),
                        chunk / 2 + chunk * Double(index))
            }
        }
            .map { (start, end) -> [Range<Double>]  in
                if start > end {
                    return [start..<360,
                            0..<end]
                } else {
                    return [start..<end]
                }
            }
            .flatMap { $0 }
        
        guard let calculatedIndex = range.firstIndex(where: { $0.contains(endDegree) }) else {
            return
        }
        
        withAnimation(nil) {
            if calculatedIndex == 0 || calculatedIndex == 1 {
                result = 0
            } else {
                result = calculatedIndex - 1
            }
        }
    }
}
