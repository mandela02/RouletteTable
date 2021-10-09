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
            
            let degree = Double(360) / Double(datasource.count)
            
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
                                .lineLimit(1)
                                .font(Font.body.bold())
                                .foregroundColor(.black)
                                .padding(.leading, radius / 4)
                                .padding(.trailing, 5)
                                .frame(maxWidth: .infinity, alignment: .center)
                        }.rotationEffect(.degrees(degree / 2))
                    }
                    .rotationEffect(.degrees(-90 - degree/2))
                    .rotationEffect(.degrees(Double(index) * degree))
                }
            }
        }
    }
}
