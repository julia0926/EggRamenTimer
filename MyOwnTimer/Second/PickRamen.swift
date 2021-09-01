//
//  PickRamen.swift
//  MyOwnTimer
//
//  Created by 김지인 on 2021/08/28.
//
import SwiftUI

struct PickRamen: View{
    var body: some View{
        VStack(spacing: 40) {
            NavigationLink(
                destination: CustomTimer(),
                label: {
                    Text("타이머 설정 ! ")
                        .font(.system(size: 30))
                        .foregroundColor(.blue)
                        .fontWeight(.bold)
                        
                })
            NavigationLink(
                destination: CustomTimer(),
                label: {
                    Text("타이머 설정 ! ")
                        .font(.system(size: 30))
                        .foregroundColor(.purple)
                        .fontWeight(.bold)

                })
        }
    }
}

struct PickRamen_Previews: PreviewProvider {
    static var previews: some View {
        PickRamen()
    }
}
