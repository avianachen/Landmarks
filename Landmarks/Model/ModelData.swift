//
//  ModelData.swift
//  Landmarks
//
//  Created by cxq on 2025/3/24.
//

import Foundation

@Observable
//SwiftUI 仅当可观察属性发生变化并且视图主体直接读取该属性时才会更新视图。
class ModelData{
    var landmarks:[Landmark] = load("landmarkData.json")
    var hikes:[Hike] = load("hikeData.json")
}



//创建一个load（_:）方法，从应用程序的主包中获取具有给定名称的JSON数据。load方法依赖于返回类型与可解码协议的一致性，可解码协议是可编码协议的一个组成部分。
func load<T: Decodable>(_ filename:String) -> T{
    let data: Data
    
    guard let file = Bundle.main.url(forResource: filename, withExtension: nil)
    else{
        fatalError("Couldn't find \(filename) in main bundle.")
    }
    do{
        data = try Data(contentsOf: file)
    }catch{
        fatalError("Couldn't load \(filename) from main bundle:\n\(error)")
    }
    
    do{
        let decoder = JSONDecoder()
        return try decoder.decode(T.self, from: data)
    }catch{
        fatalError("Couldn't prase \(filename) as \(T.self)::\n\(error)")
    }
}
