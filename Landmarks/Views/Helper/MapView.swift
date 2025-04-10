//
//  MapView.swift
//  Landmarks
//
//  Created by cxq on 2025/3/24.
//

import SwiftUI
import MapKit

struct MapView: View {
    var coordinate: CLLocationCoordinate2D
    var body: some View {
        //将地图的初始化程序更改为接受位置输入的初始化程序，以便它在值改变时更新。
        Map(position: .constant(.region(region)))
    }
    
    //创建一个私有计算变量来保存地图的区域信息。
    private var region: MKCoordinateRegion{
        MKCoordinateRegion(
            center: coordinate, span: MKCoordinateSpan(latitudeDelta: 0.2, longitudeDelta: 0.2)
        )
    }
}

#Preview {
    MapView(coordinate: CLLocationCoordinate2D(latitude: 34.011_286, longitude: -116.166_868))
}
