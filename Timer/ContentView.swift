import SwiftUI

struct ContentView: View {
    //タイマー変数の作成
    @State var timerHandeler : Timer?
    //カウント(経過時間)の変数を作成
    @State var count = 0
    //永続化する秒数設定(初期値は１０)
    @AppStorage("timer_value") var timerValue = 10
    
    let company = "Apple"
    
    //body
    var body: some View {
        NavigationView {
            VStack{
                VStack(spacing: 30) {
                Spacer()
                Text("\(timerValue - count)秒")
                    .font(.largeTitle)
                    .foregroundColor(Color.green)
                    .frame(width: 140, height: 140)
                
                HStack {
                    //startボタン
                    Button {
                        startTimer()
                    } label: {
                        Text("スタート")
                            .font(.title)
                            .foregroundColor(Color.green)
                            .frame(width: 140, height: 140)
                            .background(.blue)
                            .clipShape(Circle())
                    }
                    
                    //stopボタン
                    Button {
                        if let unwrapedTimerHandler = timerHandeler {
                            if unwrapedTimerHandler.isValid == true {
                                unwrapedTimerHandler.invalidate()
                            }
                        }
                    } label: {
                        Text("ストップ")
                            .font(.title)
                            .foregroundColor(Color.red)
                            .frame(width: 140, height: 140)
                            .background(.blue)
                            .clipShape(Circle())
                    }
                }//HStacl
                Spacer()
                Picker(selection: $timerValue, label: Text("ラベル")) {
                    Text("2").tag(2).foregroundColor(Color.green)
                    Text("10").tag(10).foregroundColor(Color.green)
                    Text("20").tag(20).foregroundColor(Color.green)
                    Text("30").tag(30).foregroundColor(Color.green)
                    Text("40").tag(40).foregroundColor(Color.green)
                    Text("50").tag(50).foregroundColor(Color.green)
                    Text("60").tag(60).foregroundColor(Color.green)
                }
                .pickerStyle(WheelPickerStyle())
                Spacer()
            }//VStack
        }//VStack
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    NavigationLink(destination: SecondView(info: timerValue)){
                        Text("値渡し(int)")
                    }
                }
            }
        }//NavigationView
    }
        
    //count機能
    func countdownTimer() {
        count += 1
        
        if timerValue - count <= 0 {
            timerHandeler?.invalidate()
        }
    }
    //開始関数
    func startTimer() {
        if let unwrapedTimerHandler = timerHandeler {
            if unwrapedTimerHandler.isValid == true {
                return
            }
        }
        
        if timerValue - count <= 0 {
            count = 0
        }
        timerHandeler = Timer.scheduledTimer(withTimeInterval: 1, repeats: true){ _ in countdownTimer()}
    }
    
    
}

struct SecondView: View {
    let info:Int
//    let timerValue:Int
    @AppStorage("timer_value") var timerValue = 10
    var body: some View {
        VStack{
            Text("SecondView Time")
                .padding()
            Text("\(timerValue)")
                .font(.largeTitle)
                .padding()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
