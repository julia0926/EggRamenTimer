//
//  PickRamen.swift
//  MyOwnTimer
//
//  Created by 김지인 on 2021/08/28.
//
import SwiftUI

extension Color {
    static let 짜왕색 = Color("짜왕색")
    static let 진짬뽕색 = Color("진짬뽕색")
    static let 안성탕면색 = Color("안성탕면색")
    static let 열라면색 = Color("열라면색")
    static let 참깨색 = Color("참깨색")
    static let 짜빠색 = Color("짜빠색")
    static let 찰비색 = Color("찰비색")
    static let 너구리색 = Color("너구리색")
    static let 까르보색 = Color("까르보색")
    static let 스낵면색 = Color("스낵면색")
    static let 팔도색 = Color("팔도색")
    static let 불닭색 = Color("불닭색")
    static let 진라면색 = Color("진라면색")
    
}

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
                    SelectRamenIcon(title: "신라면", needTime: 23, bgColor: Color.red.opacity(0.85))
                    SelectRamenIcon(title: "너구리", needTime: 23, bgColor: Color.너구리색.opacity(0.85))

                }
                HStack(spacing: 25) {
                    SelectRamenIcon(title: "진라면", needTime: 23, bgColor: Color.진라면색.opacity(0.85))
                    SelectRamenIcon(title: "안성탕면", needTime: 23, bgColor: Color.안성탕면색.opacity(0.85))
                }
                HStack(spacing: 25) {
                    SelectRamenIcon(title: "찰비빔면", needTime: 23, bgColor: Color.찰비색.opacity(0.85))
                    SelectRamenIcon(title: "팔도비빔면", needTime: 23, bgColor: Color.팔도색.opacity(0.85))
                }
                HStack(spacing: 25) {
                    SelectRamenIcon(title: "짜파게티", needTime: 23, bgColor: Color.짜빠색)
                    SelectRamenIcon(title: "짜왕", needTime: 23, bgColor: Color.짜왕색.opacity(0.95))
                }
                HStack(spacing: 25) {
                    SelectRamenIcon(title: "스낵면", needTime: 23, bgColor: Color.스낵면색)
                    SelectRamenIcon(title: "진짬뽕", needTime: 23, bgColor: Color.진짬뽕색)
                }
                HStack(spacing: 25) {
                    SelectRamenIcon(title: "불닭볶음면", needTime: 23, bgColor: Color.불닭색.opacity(0.92))
                    SelectRamenIcon(title: "까르보불닭", needTime: 23, bgColor: Color.까르보색.opacity(0.80))
                }
                HStack(spacing: 25) {
                    SelectRamenIcon(title: "열라면", needTime: 23, bgColor: Color.열라면색.opacity(0.95))
                    SelectRamenIcon(title: "참깨라면", needTime: 23, bgColor: Color.참깨색.opacity(0.85))
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
