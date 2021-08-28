//
//  MainViewScreen.swift
//  MyOwnTimer
//
//  Created by 김지인 on 2021/08/21.
//

import SwiftUI

struct MainViewScreen: View {

    var body: some View {
        NavigationView(content: {
            VStack(spacing: 40) {
                NavigationLink(
                    destination: PickRamen()) {
                    Icons(actionText: "라면 클릭!", title: "라면 끓이기", image: "ramen") }
                
                NavigationLink(
                    destination: PickEggs()) {
                    Icons(actionText: "계란 클릭!", title: "계란 삶기", image: "fireeggs") }
            }.navigationTitle("선택하기")
        })

    }
}
struct MainViewScreen_Previews: PreviewProvider {
    static var previews: some View {
        MainViewScreen()
    }
}
