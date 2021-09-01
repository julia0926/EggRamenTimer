//
//  CustomTimer.swift
//  MyOwnTimer
//
//  Created by 김지인 on 2021/08/28.
//

import SwiftUI
import UserNotifications

struct CustomTimer: View{
    
    @State var start = false
    @State var to : CGFloat = 0
    @State var count = 0
    @State var time = Timer.publish(every: 1, on: .main, in: .common).autoconnect() //1초간격으로 타이머

    var body : some View{
        ZStack{
            Color.black.opacity(0.06).edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
            VStack{
                ZStack {
                    Circle()
                        .trim(from: 0, to: 1)
                        .stroke(Color.black.opacity(0.09), style: StrokeStyle(lineWidth: 35, lineCap: .round))
                        .frame(width: 280, height: 280) //배경 원형 타이머
                    Circle()
                        .trim(from: 0, to: self.to)
                        .stroke(Color.red, style: StrokeStyle(lineWidth: 35, lineCap: .round))
                        .frame(width: 280, height: 280)
                        .rotationEffect(.init(degrees: -90))//시간 올라가는 타이머
                    VStack{
                        Text("\(self.count)")
                            .font(.system(size: 65))
                            .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                        Text("Of 15")
                            .font(.title)
                            .padding(.top)
                    } //남은 시간 타이머
                    
                }
                
                //버튼 구현
                HStack(spacing: 20){
                    //play-pause 버튼
                    Button(action: {
                        if self.count == 15{
                            self.count = 0
                            withAnimation(.default){
                                self.to = 0
                            }
                        }
                        
                        self.start.toggle()
                    }, label: {
                        HStack(spacing: 15){
                            Image(systemName: self.start ? "pause.fill" : "play.fill")
                                .foregroundColor(.white)
                            Text(self.start ? "Pause" : "Play")
                                .foregroundColor(.white)
                        }.padding(.vertical)
                        .frame(width: (UIScreen.main.bounds.width / 2) - 55)
                        .background(Color.red)
                        .clipShape(Capsule())
                        .shadow(radius: 5)
                    })
                    
                    //다시 시작 버튼
                    Button(action: {
                        self.count = 0
                        withAnimation(.default){
                            self.to = 0
                        }
                        
                    }, label: {
                        HStack(spacing: 15){
                            Image(systemName: "arrow.clockwise")
                                .foregroundColor(.red)
                            Text("Restart")
                                .foregroundColor(.red)
                        }.padding(.vertical)
                        .frame(width: (UIScreen.main.bounds.width / 2) - 55)
                        .background(
                            Capsule()
                                .stroke(Color.red, lineWidth: 2)
                        ).shadow(radius: 5)
                    })
                } //HStack
                .padding(.top, 55)
                
            } //Vstack
        } //Zstack
        
        //알람 메세지 권한 요청
        .onAppear(perform: {
            UNUserNotificationCenter.current().requestAuthorization(options: [.badge, .sound,.alert]) {(_,_) in
            }
            
        })
        
        //타이머 실행하기 위해
        .onReceive(self.time) { (_) in
            if self.start{
                if self.count != 15{
                    self.count += 1
                    print(self.count)
                    
                    withAnimation(.default){
                        self.to = CGFloat(self.count) / 15
                    }
                }else{
                    self.start.toggle()
                    self.Notify()
                }
                
            }
        }
    }
    
    func Notify() {
        let content = UNMutableNotificationContent() //알림 메세지 지정할 수 있는
        content.title = "Message"
        content.body = "타이머 종료 !!"
        content.badge = 1 //아이콘 상단에 알림 표시 !
        
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 1, repeats: false) //언제 몇초 뒤에 알림 작동할 건지
        
        let req = UNNotificationRequest(identifier: "MSG", content: content, trigger: trigger)//content와 trigger를 넘겨 받아 알림 요청
        
        UNUserNotificationCenter.current().add(req, withCompletionHandler: nil)
        //알림을 "예약" 할 수 있다. 알림요청을 처리
    }
    
    
}

struct CustomTimer_Previews: PreviewProvider {
    static var previews: some View {
        CustomTimer()
    }
}
