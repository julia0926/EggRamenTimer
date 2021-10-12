//
//  PickRamen.swift
//  MyOwnTimer
//
//  Created by 김지인 on 2021/08/28.
//
import SwiftUI
import UIKit
extension Color {
    static let 신라면 = Color.red.opacity(0.95)
    static let 삼양라면 = Color.orange.opacity(0.97)
    static let 진짬뽕 = Color("진짬뽕색")
    static let 안성탕면 = Color("안성탕면색")
    static let 열라면 = Color("열라면색")
    static let 참깨라면 = Color("참깨색")
    static let 짜파게티 = Color("짜빠색")
    static let 짜왕 = Color("짜왕색")
    static let 찰비빔면 = Color("찰비색")
    static let 너구리 = Color("너구리색")
    static let 까르보불닭 = Color("까르보색")
    static let 스낵면 = Color("스낵면색")
    static let 팔도비빔면 = Color("팔도색")
    static let 불닭볶음면 = Color("불닭색")
    static let 진라면 = Color("진라면색")
    static let 부대찌개면 = Color("부대색")
    
}

struct RamenItem: Hashable, Identifiable{
    var id: UUID
    var title: String
    var color: Color
    var time: Int
   
    init(title: String, color: Color, time: Int){
        self.id = UUID()
        self.title = title
        self.color = color
        self.time = time
    }
}

struct PickRamen: View{
    @State var isBarActive = false
    @State var draggedItem: RamenItem?
    @State var isEditModeOn: Bool = false
    @State var ramenList = [
        RamenItem(title: "신라면", color: .신라면, time: 270),
        RamenItem(title: "너구리", color: .너구리, time: 300),
        RamenItem(title: "진라면", color: .진라면, time: 240),
        RamenItem(title: "안성탕면", color: .안성탕면, time: 270),
        RamenItem(title: "삼양라면", color: .삼양라면, time: 270),
        RamenItem(title: "참깨라면", color: .참깨라면, time: 240),
        RamenItem(title: "열라면", color: .열라면, time: 240),
        RamenItem(title: "진짬뽕", color: .진짬뽕, time: 300),
        RamenItem(title: "팔도비빔면", color: .팔도비빔면, time: 180),
        RamenItem(title: "찰비빔면", color: .찰비빔면, time: 180),
        RamenItem(title: "짜파게티", color: .짜파게티, time: 300),
        RamenItem(title: "짜왕", color: .짜왕, time: 300),
        RamenItem(title: "불닭볶음면", color: .불닭볶음면, time: 300),
        RamenItem(title: "까르보불닭", color: .까르보불닭, time: 300),
        RamenItem(title: "스낵면", color: .스낵면, time: 120)
    ]
    let columns = Array(repeating: GridItem(.flexible(),spacing: 0), count: 2)
    var body: some View{
 
        VStack(spacing: 15) {
            Toggle("수정모드:", isOn: $isEditModeOn)
            
            ScrollView{
                VStack(alignment: .center, spacing: 7) {
                    Text("오늘의 라면 메뉴는?")
                        .bold()
                        .font(.system(size: 20))
                    Divider().opacity(0)

                }
                .frame(height: 60)
                .background(Color.gray.opacity(0.1))
                .cornerRadius(20)
                
                LazyVGrid(columns: columns, spacing: 7, content: {
                    ForEach(ramenList, id:\.self){ ramenIcon in
                            //1
                            NavigationLink(
                                destination: CustomTimer(ramenIcon.time, ramenIcon.time, ramenIcon.title, ramenIcon.color),
                                label: {
                                    SelectRamenIcon(title: ramenIcon.title, bgColor: ramenIcon.color)
                            })
                            .onDrag{
                                self.draggedItem = ramenIcon
                                return NSItemProvider(item: nil, typeIdentifier: ramenIcon.title)
                                }
                            .onDrop(of: [ramenIcon.title], delegate: DropViewDelegate(currentItem: ramenIcon, ramenList: $ramenList, draggedItem: $draggedItem, isEditModeOne: $isEditModeOn))
                        }
                })
                            
                Divider().opacity(0) //줄을 긋고 투명하게 해서 꽉채움 가로로
            }
        }//VStack
        .navigationTitle("라면 선택").navigationBarTitleDisplayMode(.inline)
    } //body
    
}





struct PickRamen_Previews: PreviewProvider {
    static var previews: some View {
        PickRamen()
    }
}
