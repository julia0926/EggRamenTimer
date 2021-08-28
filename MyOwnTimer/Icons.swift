//
//  Icons.swift
//  MyOwnTimer
//
//  Created by 김지인 on 2021/08/21.
//

import SwiftUI

struct Icons: View{
    var actionText : String
    var title : String
    var image : String
    
    var body: some View{
        VStack(spacing: 20){
            Image(image)
                .resizable()
                .frame(width: 100, height: 100, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
            Text(title)
                .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                .foregroundColor(.black)
                .font(.system(size: 20))
        }
//        Button(action: {
//            print(actionText)
//        }, label: {
//            VStack(spacing: 20){
//                Image(image)
//                    .resizable()
//                    .frame(width: 100, height: 100, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
//                Text(title)
//                    .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
//                    .foregroundColor(.black)
//                    .font(.system(size: 20))
//            }
//        })
    }
}

struct Icons_Previews: PreviewProvider {
    static var previews: some View {
        Icons(actionText: "계란 클릭!", title: "계란 삶기", image: "fireeggs")
    }
}
