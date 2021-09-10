//
//  CustomTimer.swift
//  MyOwnTimer
//
//  Created by 김지인 on 2021/08/28.
//

import SwiftUI
import UserNotifications
import AVFoundation


extension Color{
    static let btn = Color("restart_button")
}


struct CustomTimer: View{
    
    @State var start = false
    @State var end : Bool = false
    @State var to : CGFloat = 0
    @State var count = 0
    @State var time = Timer.publish(every: 1, on: .main, in: .common).autoconnect() //1초간격으로 타이머
    @State var showTime : Int  //화면에 보여질 분초
    
    let ripeTime : Int
    let title : String
    var timer: Timer = Timer()
    @State var sound: AVAudioPlayer!

    init(_ ripeTime: Int = 3, _ showTime: Int = 3, _ title: String = "머머계란") {
        self.ripeTime = ripeTime
        self.showTime = self.ripeTime
        self.title = title
    }

    var body : some View{
        ZStack{
//            Color.black.opacity(0.06).edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
            VStack{
                Text("🥚 \(title)")
                    .font(.system(size: 30))
                    .fontWeight(.bold).padding(.bottom, 40)

                ZStack {
                    Circle()
                        .trim(from: 0, to: 1)
                        .stroke(Color.black.opacity(0.09), style: StrokeStyle(lineWidth: 30, lineCap: .round))
                        .frame(width: 300, height: 300) //배경 원형 타이머
                    Circle()
                        .trim(from: 0, to: self.to)
                        .stroke(Color.yellow, style: StrokeStyle(lineWidth: 30, lineCap: .round))
                        .frame(width: 300, height: 300)
                        .rotationEffect(.init(degrees: -90))//시간 올라가는 타이머
                    HStack{
                        Text("\(timeString(time: showTime))")
                            .font(.system(size: 65))
                            .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                        
                    } //남은 시간 타이머
                    
                }.padding(.bottom, 70)
                
                //버튼 구현
                HStack(spacing: 80){
                    //play-pause 버튼
                    Button(action: {
                        if self.count == ripeTime{
                            self.count = 0
                            withAnimation(.default){
                                self.to = 0
                            }
                        }
                        self.start.toggle()
                    }, label: {
                        VStack(spacing: 15){
                            Image(systemName: self.start ? "pause.fill" : "play.fill")
                                .foregroundColor(.white)
                                .font(.title)

                            Text(self.start ? "Pause" : "Play")
                                .foregroundColor(.white)
                                .bold()
                        }.padding(.vertical)
                        .frame(width: 100, height: 100, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                        .background(self.end ? Color.gray.opacity(0.12) : Color.yellow)
                        .clipShape(Circle())
                        .shadow(radius: 3)
                    }).disabled(end)
                    
                    //다시 시작 버튼
                    Button(action: {
                        self.count = 0
                        self.end.toggle()
                        self.showTime = self.ripeTime
                        withAnimation(.default){
                            self.to = 0
                        }
                        
                    }, label: {
                        VStack(spacing: 7){
                            Image(systemName: "arrow.clockwise")
                                .foregroundColor(.white)
                                .font(.title)
                            Text("Restart")
                                .foregroundColor(.white)
                                .bold()
                        }.padding(.vertical)
                        .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, height: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                        .background(self.end ? Color.yellow : Color.gray.opacity(0.12))
                        .clipShape(Circle())
                        .shadow(radius: 3)

                    }).disabled(!end)
                } //HStack
                .padding(.top, 30)
                
            } //Vstack
        } //Zstack
        
        //알람 메세지 권한 요청
        .onAppear(perform: {
            UNUserNotificationCenter.current().requestAuthorization(options: [.badge, .sound,.alert]) {(_,_) in
            }
            
        })
        
        //타이머 실행하기 위해
        .onReceive(self.time) { (_) in

            if self.start{ //true
                if self.count != ripeTime{

                    self.count += 1
                    self.showTime -= 1

                    print(self.count)
                    withAnimation(.default){
                        self.to = CGFloat(self.count) / CGFloat(ripeTime)
                    }
                }else{ //타이머가 끝나면
                    self.start.toggle() //false로 바뀜
                    self.end.toggle()
                    Notify()
                    playSound()
                    timer.invalidate()

                }

            }
        }
    }
    //시간 계산
    func timeString(time: Int) -> String {
            let minutes = Int(time) / 60
            let seconds = Int(time) % 60
            return String(format:"%02i:%02i", minutes, seconds)
    }
    
    func playSound() {
            let url = Bundle.main.url(forResource: "PopSoundEffect", withExtension: "mp3")
            sound = try! AVAudioPlayer(contentsOf: url!)
            sound.play()
                    
    }
    //끝낼 때 알림 보내기
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
