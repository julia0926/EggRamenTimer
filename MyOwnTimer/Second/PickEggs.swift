//
//  PickEggs.swift
//  MyOwnTimer
//
//  Created by 김지인 on 2021/08/28.
//

import SwiftUI

struct ColorManager{
    static let hardEggColor = Color("hard_egg_color")
}

struct PickEggs: View{
    
    var body: some View{
        VStack(spacing: 15) {
            VStack(alignment: .center, spacing: 7) {
                Text("여러분의 계란 삶기 취향은 ?")
                    .bold()
                    .font(.system(size: 20))
                Divider().opacity(0)

            }
            .frame(height: 60)
            .background(Color.gray.opacity(0.1))
            .cornerRadius(20)
            
            ScrollView{
                NavigationLink(
                    destination: CustomTimer(480, 480, "완전 반숙"),
                    label: {
                        SelectIconList(image: "soft_egg", title: "완전 반숙", needTime: 8, description: "건들이면 톡 터질듯한 노른자가       먹고 싶다면 ?", bgColor: Color.orange)
                            .hideRowSeparator(insets: EdgeInsets(top: 10, leading: 10, bottom: 10, trailing: 10), background: Color.white)
                    })
                NavigationLink(
                    destination: CustomTimer(600, 600, "반숙"),
                    label: {
                        SelectIconList(image: "medium_egg", title: "반숙", needTime: 10, description: "촉촉하고 포슬포슬                              노른자가 땡긴다면 ?", bgColor: Color.yellow)
                            .hideRowSeparator(insets: EdgeInsets(top: 10, leading: 10, bottom: 10, trailing: 10), background: Color.white)
                    })
                NavigationLink(
                    destination: CustomTimer(720, 720, "완숙"),
                    label: {
                        SelectIconList(image: "hard_egg", title: "완숙", needTime: 12, description: "오리지널 노른자 맛을                      느끼고 싶다면 ?", bgColor: ColorManager.hardEggColor)
                            .hideRowSeparator(insets: EdgeInsets(top: 10, leading: 10, bottom: 10, trailing: 10), background: Color.white)
                     
                    })
            }
           
        } //VStack
        .navigationTitle("계란 선택")
    } //body
}


struct PickEggs_Previews: PreviewProvider {
    static var previews: some View {
        PickEggs()
    }
}



//리스트의 선 없애는 struct
struct HideRowSeparatorModifier: ViewModifier {
    static let defaultListRowHeight: CGFloat = 44
    
    var insets: EdgeInsets
    var background: Color
    init(insets: EdgeInsets, background: Color){
        self.insets = insets
        
        var alpha: CGFloat = 0
        
        UIColor(background).getWhite(nil, alpha: &alpha)
        assert(alpha == 1, "")
        self.background = background
    }
    
    func body(content: Content) -> some View {
        content
            .padding(insets)
            .frame(
                minWidth: 0, maxWidth: .infinity, minHeight: Self.defaultListRowHeight,   alignment: .leading
            )
            .listRowInsets(EdgeInsets())
            .background(background)
    }
}
extension EdgeInsets{
    static let defaultListRowInsets = Self(top: 10, leading: 10, bottom: 10, trailing: 10)
}
extension View {
    func hideRowSeparator(insets: EdgeInsets = .defaultListRowInsets, background: Color = .white)
    -> some View {
        modifier(HideRowSeparatorModifier(insets: insets, background: background))
    }
}


