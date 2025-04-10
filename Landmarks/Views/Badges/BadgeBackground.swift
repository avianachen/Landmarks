//
//  BadgeBackground.swift
//  Landmarks
//
//  Created by cxq on 2025/3/25.
//

import SwiftUI

struct BadgeBackground: View {
    //可以使用路径组合线条、曲线和其他绘图图元来形成更复杂的形状，如徽章的六边形背景。
    var body: some View {
        //将路径封装在一个GeometryReader中，这样徽章就可以使用包含它的视图的大小，它定义了大小，而不是硬编
        //使用几何图形的两个维度中最小的一个，当其包含的视图不是正方形时，可以保留徽章的长宽比。
        GeometryReader{ geometry in
            Path{path in
                //向路径添加一个起点，假设容器的尺寸为 100 x 100 像素。
                var width: CGFloat = min(geometry.size.width, geometry.size.height)
                let height = width
                //使用xScale在x轴上缩放形状，然后添加xOffset以使形状在其几何形状中重新居中。
                let xScale:CGFloat = 0.832
                let xOffset = (width*(1.0-xScale))/2.0
                width *= xScale
                //该move(to:)方法将绘图光标在形状的边界内移动,就好像一支假想的笔或铅笔悬停在该区域上，等待开始绘图。
                path.move(
                    to: CGPoint(
                        x: width*0.95+xOffset,
                        y: height*(0.20+HexagonParameters.adjustment)
                    )
                )
                //为形状数据的每个点绘制线条以创建粗略的六边形。
                HexagonParameters.segments.forEach{segment in
                    //addLine（to:）方法获取一个点并绘制它。对addLine（to:）的连续调用从前一个点开始一行，并继续到新的点。
                    path.addLine(to: CGPoint(x: width*segment.line.x+xOffset, y: height*segment.line.y))
                    //使用addQuadCurve(to:control:)方法绘制徽章角落的贝塞尔曲线。
                    path.addQuadCurve(to: CGPoint(
                        x:width*segment.curve.x+xOffset,
                        y:height*segment.curve.y
                    ), control: CGPoint(x: width*segment.control.x+xOffset, y: height*segment.control.y))
                    
                }
                
            }
            //用渐变填充背景
            .fill(.linearGradient(
                Gradient(colors:[Self.gradientStart,Self.gradientEnd]),
                startPoint: UnitPoint(x: 0.5, y: 0),
                endPoint: UnitPoint(x: 0.5, y: 0.6)
            ))
        }
        //对渐变填充应用aspectRatio（_:contentMode:）修改器。通过保持 1：1 的宽高比，即使徽章的祖先视图不是正方形，它也能保持其在视图中心的位置。
        .aspectRatio(1,contentMode: .fit)
    }
    static let gradientStart = Color(red:239.0/255,green:122.0/255,blue:221.0/255)
    static let gradientEnd = Color(red:239.0/255,green:172.0/255,blue:120.0/255)
}

#Preview {
    BadgeBackground()
}
