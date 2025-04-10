//
//  BadgeSymbol.swift
//  Landmarks
//
//  Created by cxq on 2025/3/25.
//

import SwiftUI
//构建匹配的徽章符号
struct BadgeSymbol: View {
    //用设计中的紫色填充符号。
    static let symbolColor = Color(red:79.0/255,green: 79.0/255,blue: 191.0/255)
    var body: some View {
        
        GeometryReader{ geometry in
            Path{path in
                //使用路径api绘制symbol的顶部。调整与间距、topWidth和topHeight常量关联的数字乘法器，以查看它们如何影响整体形状。
                let width = min(geometry.size.width,geometry.size.height)
                let height = width * 0.75
                let spacing = width * 0.030
                let middle = width * 0.5
                let topWidth = width * 0.226
                let topHeight = height * 0.488
                
                path.addLines([
                    CGPoint(x: middle, y: spacing),
                    CGPoint(x:middle - topWidth,y: topHeight - spacing),
                    CGPoint(x: middle, y: topHeight/2 + spacing),
                    CGPoint(x:middle + topWidth,y:topHeight - spacing),
                    CGPoint(x: middle, y: spacing)
                ])
                //绘制符号的底部。使用move(to:)修改器在同一路径中的多个形状之间插入间隙。
                path.move(to: CGPoint(x:middle,y: topHeight/2 + spacing * 3))
                    path.addLines([CGPoint(x: middle - topWidth, y: topHeight + spacing),CGPoint(x: spacing, y: height - spacing),CGPoint(x: width - spacing, y: height - spacing),CGPoint(x: middle + topWidth, y: topHeight + spacing),CGPoint(x: middle, y: topHeight / 2 + spacing * 3)])
                
            }
            .fill(Self.symbolColor)
        }
    }
}

#Preview {
    BadgeSymbol()
}
