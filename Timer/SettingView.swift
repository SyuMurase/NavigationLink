import SwiftUI

struct SettingView: View {
    @State var timerValue = 10
    var body: some View {
        VStack {
            Spacer()
            Text("\(timerValue)秒")
                .font(.largeTitle)
                .foregroundColor(Color.green)
            Spacer()
            Picker(selection: $timerValue, label: Text("ラベル")) {
                Text("10").tag(10).foregroundColor(Color.green)
                Text("20").tag(20).foregroundColor(Color.green)
                Text("30").tag(30).foregroundColor(Color.green)
                Text("40").tag(40).foregroundColor(Color.green)
                Text("50").tag(50).foregroundColor(Color.green)
                Text("60").tag(60).foregroundColor(Color.green)
            }
            .pickerStyle(WheelPickerStyle())
        }
        .background(.black)

    }
}

struct SettingView_Previews: PreviewProvider {
    static var previews: some View {
        SettingView()
    }
}
