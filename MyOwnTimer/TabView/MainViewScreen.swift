//
//  MainViewScreen.swift
//  MyOwnTimer
//
//  Created by 김지인 on 2021/08/21.
//

import SwiftUI


extension Color{
    static let menu = Color("menu")
    static let selectList = Color("selectList")

}

struct MainViewScreen: View {
    

    var body: some View {
        NavigationView{
            VStack {
                Spacer()
                HStack{
                    NavigationLink(
                        destination: SettingList(),
                        label: {
                            Image(systemName: "list.dash")
                                .font(.largeTitle)
                                .foregroundColor(.selectList)
                        })
                    Spacer()
                    
                    //                    Text("라면 Pick !")
                    //                        .font(.system(size: 20))
                    //                        .bold()
                    //                    Spacer()
                    
                    
                }.padding(.trailing)
                .padding(.leading)
                .padding(.bottom, 10)
                Text("Menu")
                    .fontWeight(.bold)
                    .font(.system(size: 32))
                    .frame(width: 220, height: 45, alignment: .center)
                    .background(Color.menu)
                    .foregroundColor(.white)
                    .cornerRadius(8)
                    .shadow(color: .gray, radius: 3, x: 2, y: 3)
                ScrollView{
                    VStack{
                        VStack(alignment: .center, spacing: 18){
                            NavigationLink(
                                destination: PickRamen()) {
                                Icons(actionText: "라면 클릭!", title: "라면 끓이기", image: "ramen") }
                            
                            NavigationLink(
                                destination: PickEggs()) {
                                Icons(actionText: "계란 클릭!", title: "계란 삶기", image: "fireeggs") }
                        }
                        
                        
                        
                    }
                    
                    
                    
                }
                
            }
            //VStack
            .navigationTitle("Back")
            .navigationBarHidden(true)
        } //NavigationView

    }
}
struct MainViewScreen_Previews: PreviewProvider {
    static var previews: some View {
        MainViewScreen()
    }
}
