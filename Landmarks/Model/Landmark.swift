//
//  Landmark.swift
//  Landmarks
//
//  Created by cxq on 2025/3/24.
//

import Foundation
import SwiftUI
import CoreLocation

//定义一个Landmark结构，其中一些属性与landmarkData数据文件中的一些键的名称相匹配。
struct Landmark: Hashable,Codable,Identifiable{
    //添加“Codable”一致性使得在结构和数据文件之间移动数据变得更加容易。在本节后面的部分中，您将依赖Codable协议的decoable组件从文件中读取数据。
    var id: Int
    var name:String
    var park:String
    var state:String
    var description:String
    var isFavorite: Bool
    
    //添加一个imageName属性来从数据中读取图像的名称，以及一个计算属性来从资产目录中加载图像。
    private var imageName: String
    var image:Image{
        Image(imageName)
    }
    private var coordinates:Coordinates
    //使用嵌套类型向结构添加一个属性Coordinates，该属性反映 JSON 数据结构中的存储。
    struct Coordinates:Hashable,Codable{
        var latitude: Double
        var longitude: Double
    }
    
    //计算与 MapKit 框架交互有用的属性——locationCoordinate
    var locationCoordinate: CLLocationCoordinate2D{
        CLLocationCoordinate2D(
            latitude: coordinates.latitude,
            longitude: coordinates.longitude)
    }
}
