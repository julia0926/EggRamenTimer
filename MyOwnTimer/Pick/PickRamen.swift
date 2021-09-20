//
//  PickRamen.swift
//  MyOwnTimer
//
//  Created by 김지인 on 2021/08/28.
//
import SwiftUI

struct PickRamen: View{
    @State var isBarActive = false
    var body: some View{
        VStack(spacing: 15) {
//            VStack(alignment: .center, spacing: 7) {
//                Text("라면 선택")
//                    .bold()
//                    .font(.system(size: 20))
//                Divider().opacity(0)
//
//            }
//            .frame(height: 60)
//            .background(Color.gray.opacity(0.1))
//            .cornerRadius(20)
            
            ScrollView{
                HStack(spacing: 25) {
                    SelectRamenIcon(title: "신라면", needTime: 23, bgColor: Color.orange)
                    SelectRamenIcon(title: "너구리", needTime: 23, bgColor: Color.orange)

                }
                HStack(spacing: 25) {
                    SelectRamenIcon(title: "진라면", needTime: 23, bgColor: Color.pink)
                    SelectRamenIcon(title: "안성탕면", needTime: 23, bgColor: Color.orange)
                }
                HStack(spacing: 25) {
                    SelectRamenIcon(title: "찰비빔면", needTime: 23, bgColor: Color.pink)
                    SelectRamenIcon(title: "팔도비빔면", needTime: 23, bgColor: Color.orange)
                }
                HStack(spacing: 25) {
                    SelectRamenIcon(title: "짜파게티", needTime: 23, bgColor: Color.pink)
                    SelectRamenIcon(title: "짜왕", needTime: 23, bgColor: Color.orange)
                }
                HStack(spacing: 25) {
                    SelectRamenIcon(title: "스낵면", needTime: 23, bgColor: Color.pink)
                    SelectRamenIcon(title: "진짬뽕", needTime: 23, bgColor: Color.orange)
                }
                HStack(spacing: 25) {
                    SelectRamenIcon(title: "스낵면", needTime: 23, bgColor: Color.pink)
                    SelectRamenIcon(title: "진짬뽕", needTime: 23, bgColor: Color.orange)
                }
                
               
                
                Divider().opacity(0) //줄을 긋고 투명하게 해서 꽉채움 가로로
            }
        }//VStack
    .navigationTitle("라면 선택")
    } //body
    
}


struct PickRamen_Previews: PreviewProvider {
    static var previews: some View {
        PickRamen()
    }
}
