//
//  MainViewScreen.swift
//  MyOwnTimer
//
//  Created by 김지인 on 2021/08/21.
//

import SwiftUI

struct MainViewScreen: View {
    var body: some View {
        VStack(alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/, spacing: 50) {
            HStack(alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/, spacing: 60) {
                Icons(actionText: "라면 클릭!", title: "라면 끓이기", image: "ramen")
                Icons(actionText: "계란 클릭!", title: "계란 삶기", image: "fireeggs")
            }
            HStack(alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/, spacing: 60) {
                Icons(actionText: "스트레칭 클릭!", title: "스트레칭 하기", image: "stretch")
                Icons(actionText: "양치하기 클릭!", title: "양치하기", image: "toothbrush")
            }
            HStack(alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/, spacing: 60) {
                Icons(actionText: "계단 오르기 클릭!", title: "계단 오르기", image: "upstair")
                Icons(actionText: "명상 클릭", title: "명상하기", image: "meditation")
            }
            
        } //Vstack
    }
}

struct MainViewScreen_Previews: PreviewProvider {
    static var previews: some View {
        MainViewScreen()
    }
}
