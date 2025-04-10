//
//  LandmarkDetail.swift
//  Landmarks
//
//  Created by cxq on 2025/3/25.
//

import SwiftUI

struct LandmarkDetail: View {
    @Environment(ModelData.self) var modelData
    var landmark:Landmark
    //通过与模型数据进行比较来计算输入地标的索引。
    var landmarkIndex: Int{
        modelData.landmarks.firstIndex(where: {$0.id == landmark.id})!
    }
    
    var body: some View {
        @Bindable var modelData = modelData
        
        ScrollView {
            MapView(coordinate: landmark.locationCoordinate)
                .frame(height: 300)
            //图像指定垂直偏移量 -130 点，以及距离视图底部 -130 点的填充。通过将图像向上移动来为文本腾出空间。
            CircleImage(image: landmark.image).offset(y:-130)
                .padding(.bottom,-130)
            VStack(alignment: .leading) {
                HStack {
                    Text(landmark.name)
                        .font(.title)
                    FavoriteButton(isSet: $modelData.landmarks[landmarkIndex].isFavorite)
                }
                HStack {
                    Text(landmark.park)
                        
                    Spacer()
                    Text(landmark.state)
                    
                }
                //当您将修改器应用于堆栈等布局视图时，SwiftUI 会将修改器应用于组中包含的所有元素。
                .font(.subheadline)
                .foregroundStyle(.secondary)
                //为地标添加分隔线和一些额外的描述性文字。
                Divider()
                
                Text("About \(landmark.name)")
                    .font(.title2)
                Text(landmark.description)
            }
            .padding()
            //Spacer()
        }
        //调用navigationTitle（_:）修饰符在显示详细视图时给导航栏一个标题，调用navigationBarTitleDisplayMode（_:）修饰符使标题内联显示。
        .navigationTitle(landmark.name)
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    let modelData = ModelData()
    return LandmarkDetail(landmark: ModelData().landmarks[0])
        .environment(modelData)
}
