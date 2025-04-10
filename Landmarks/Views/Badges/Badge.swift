//
//  Badge.swift
//  Landmarks
//
//  Created by cxq on 2025/3/28.
//

import SwiftUI

struct Badge: View {
    //添加ForEach视图来旋转并显示徽章符号的副本。
    var badgeSymbols: some View{
        ForEach(0..<8){ index in
            RotatedBadgeSymbol(
                angle: .degrees(Double(index)/Double(8)) * 360)
        }.opacity(0.5)
    }
    var body: some View {
        ZStack{
            BadgeBackground()
            //将徽章符号放置在徽章背景上,并纠正徽章符号的大小
            GeometryReader{ geometry in badgeSymbols.scaleEffect(1.0/4.0,anchor: .top).position(x:geometry.size.width/2.0,y: (3.0/4.0) * geometry.size.height)
                
            }
        }
        .scaledToFit()
    }
}

#Preview {
    Badge()
}
