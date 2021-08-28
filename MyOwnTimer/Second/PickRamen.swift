//
//  PickRamen.swift
//  MyOwnTimer
//
//  Created by 김지인 on 2021/08/28.
//
import SwiftUI

struct PickRamen: View{
    var body: some View{
        VStack {
            NavigationLink(
                destination: CustomTimer(),
                label: {
                    Text("라면 종류별로 선택")
                })
        }
    }
}

struct PickRamen_Previews: PreviewProvider {
    static var previews: some View {
        PickRamen()
    }
}
