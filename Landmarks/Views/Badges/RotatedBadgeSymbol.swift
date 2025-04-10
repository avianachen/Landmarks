//
//  RotatedBadgeSymbol.swift
//  Landmarks
//
//  Created by cxq on 2025/3/28.
//

import SwiftUI
//封装旋转符号
struct RotatedBadgeSymbol: View {
    let angle:Angle
    var body: some View {
        BadgeSymbol().padding(-60).rotationEffect(angle,anchor: .bottom)
    }
}

#Preview {
    RotatedBadgeSymbol(angle: Angle(degrees: 5))
}
