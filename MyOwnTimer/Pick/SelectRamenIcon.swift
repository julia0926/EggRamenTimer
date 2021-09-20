//
//  SelectRamenIcon.swift
//  MyOwnTimer
//
//  Created by 김지인 on 2021/09/20.
//

import SwiftUI

struct SelectRamenIcon: View{
    var title: String
    var needTime: Int
    var bgColor: Color
    
    var body: some View{
        VStack(spacing: 5){
            Image(title)
                .resizable()
                .scaledToFill()
                .frame(width: 130, height: 130, alignment: .center)
                //.frame(width: 100, height: 100)
            
            VStack(alignment: .leading, spacing: 0){
                Text(title)
                    .font(.system(size: 23))
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                Text("\(needTime)분")
                    .font(.system(size: 17))
                    .fontWeight(.bold)
                    .foregroundColor(.white)
            }

        }
        .frame(width: 150, height: 190)
        .background(bgColor)
        .cornerRadius(30)
        .shadow(color: .gray, radius: 6, x: 2, y: 5)
        .padding(.bottom, 13)

        
        
            
    }
}



struct SelectRamenIcon_Previews: PreviewProvider {
    static var previews: some View {
        SelectRamenIcon(title: "진라면", needTime: 23, bgColor: Color.pink)
    }
}
