//
//  RoletteTable.swift
//  Roulette
//
//  Created by TriBQ on 09/10/2021.
//

import SwiftUI

struct RoletteTable: View {
    let datasource: [PieSlideModel]
    
    let result: Int?
    
    var body: some View {
        GeometryReader { proxy in
            let center = CGPoint(x: proxy.frame(in: .local).midX,
                                 y: proxy.frame(in: .local).midY)
            
            let radius = proxy.frame(in: .local).width/2
            
            let degree = Double(360/datasource.count)
            
            ZStack {
                ForEach(datasource.indices, id: \.self) { index in
                    let data = datasource[index]
                    
                    ZStack() {
                        PieSlideView(center: center,
                                     radius: radius,
                                     startDegree: 0,
                                     endDegree: degree,
                                     isSelected: index == result,
                                     accentColor: data.color,
                                     separatorColor: Color.white)
                        HStack {
                            Color.clear
                                .frame(maxWidth: .infinity)
                            Text(data.title)
                                .font(Font.body.bold())
                                .foregroundColor(.white)
                                .frame(maxWidth: .infinity)
                                .offset(x: 20)
                        }.rotationEffect(.degrees(degree / 2))
                    }
                    .rotationEffect(.degrees(-90 - degree/2))
                    .rotationEffect(.degrees(Double(index) * degree))
                }
            }
        }
    }
}
