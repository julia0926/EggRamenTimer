//
//  SelectIconList.swift
//  MyOwnTimer
//
//  Created by 김지인 on 2021/08/28.
//

import SwiftUI

struct SelectIconList: View{
    
    var image: String
    var title: String
    var needTime: Int
    var description: String
    var bgColor: Color
    
    var body: some View{
        HStack(spacing: 20){
            Image(image)
                .resizable()
                .frame(width: 85, height: 100, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                .font(.system(size: 60))
                .foregroundColor(.white)
                //.frame(width: 100, height: 100)
            
            VStack(alignment: .leading, spacing: 0){
                Divider().opacity(0) //줄을 긋고 투명하게 해서 꽉채움 가로로
                Text(title)
                    .font(.system(size: 27))
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                Text("소요시간 : \(needTime)분")
                    .font(.system(size: 15))
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                Spacer().frame(height: 15)
                Text(description)
                    .foregroundColor(.black)
                
            }
        }.padding(20)
        .frame(height: 160)
        .background(bgColor)
        .cornerRadius(20)
    }
}

struct SelectIconList_Previews: PreviewProvider {
    static var previews: some View {
        SelectIconList(image: "soft_egg", title: "완전 반숙", needTime: 8, description: "촉촉하고 부드러운 노른자로            삶아집니다.", bgColor: Color.orange)
    }
}
