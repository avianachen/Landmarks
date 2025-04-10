//
//  CircleImage.swift
//  Landmarks
//
//  Created by cxq on 2025/3/24.
//

import SwiftUI

struct CircleImage: View {
    var image: Image
    var body: some View {
        image
        //将要显示的图像的名称传递给Image(_:)
        //to apply the circular clipping shape to the image.该Circle类型是一种形状，您可以将其用作蒙版，或者通过为圆圈添加描边或填充来将其用作视图。
            .clipShape(Circle())
        //创建另一个带有灰色描边的圆圈，然后将其添加为覆盖层，为图像提供边框。
            .overlay{
                Circle().stroke(.white,lineWidth: 4)
            }
        //添加一个半径为 7 点的阴影。
            .shadow(radius: 7)
    }
}

#Preview {
    CircleImage(image: Image("turtlerock"))
}
