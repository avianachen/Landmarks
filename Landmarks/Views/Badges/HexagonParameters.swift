//
//  HexagonParameters.swift
//  Landmarks
//
//  Created by cxq on 2025/3/25.
//

import CoreGraphics

struct HexagonParameters{
    //定义一个Segment结构来保存代表六边形一条边的三个点；导入CoreGraphics，这样你就可以使用CGPoint
    //每条边从前一条的终点开始，沿直线移动到第一个点，然后在拐角沿bsamzier曲线移动到第二个点。第三个点控制曲线的形状。
    struct Segment{
        let line:CGPoint
        let curve:CGPoint
        let control:CGPoint
    }
    //添加调整值，可调整六边形的形状。
    static let adjustment: CGFloat = 0.085

    //创建一个数组来保存段。添加六个线段的数据，六边形的每一边一个线段。
        static let segments = [
            Segment(
                line:    CGPoint(x: 0.60, y: 0.05),
                curve:   CGPoint(x: 0.40, y: 0.05),
                control: CGPoint(x: 0.50, y: 0.00)
            ),
            Segment(
                line:    CGPoint(x: 0.05, y: 0.20 + adjustment),
                curve:   CGPoint(x: 0.00, y: 0.30 + adjustment),
                control: CGPoint(x: 0.00, y: 0.25 + adjustment)
            ),
            Segment(
                line:    CGPoint(x: 0.00, y: 0.70 - adjustment),
                curve:   CGPoint(x: 0.05, y: 0.80 - adjustment),
                control: CGPoint(x: 0.00, y: 0.75 - adjustment)
            ),
            Segment(
                line:    CGPoint(x: 0.40, y: 0.95),
                curve:   CGPoint(x: 0.60, y: 0.95),
                control: CGPoint(x: 0.50, y: 1.00)
            ),
            Segment(
                line:    CGPoint(x: 0.95, y: 0.80 - adjustment),
                curve:   CGPoint(x: 1.00, y: 0.70 - adjustment),
                control: CGPoint(x: 1.00, y: 0.75 - adjustment)
            ),
            Segment(
                line:    CGPoint(x: 1.00, y: 0.30 + adjustment),
                curve:   CGPoint(x: 0.95, y: 0.20 + adjustment),
                control: CGPoint(x: 1.00, y: 0.25 + adjustment)
            )
        ]
}
