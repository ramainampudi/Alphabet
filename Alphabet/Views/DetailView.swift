//
//  detailView.swift
//  Alphabet
//
//  Created by Rama Krishna Inampudi on 25/11/20.
//

import SwiftUI
import AVFoundation

struct DetailView: View {
    
    var array: [String]
    @State private var index = 0
    @State private var buttonDisabled = false
    @State private var backButtonDisabled = true
    @State private var nextButtonDisabled = false
    @State var player: AVAudioPlayer!
    
    var body: some View {
        VStack {
            Spacer()
            ZStack {
                Text(array[self.index])
                    .font(.system(size: UIScreen.main.bounds.width / CGFloat(array[self.index].count)))
                    //                    .foregroundColor(.init(red: Double.random(in: 0...0.9), green: Double.random(in: 0...0.9), blue: Double.random(in: 0...0.9)))
                    .foregroundColor(.white)
                    .background(
                        RoundedRectangle(cornerRadius: /*@START_MENU_TOKEN@*/25.0/*@END_MENU_TOKEN@*/, style: .continuous)
                            .frame(width: UIScreen.main.bounds.width - 40, height: 450, alignment: .center)
                            .foregroundColor(.init(red: Double.random(in: 0...0.7), green: Double.random(in: 0...0.7), blue: Double.random(in: 0...0.7)))
                    )
                    .onTapGesture {
                        playsound(soundName: array[self.index])
                    }
            }
            Spacer()
            HStack {
                Button(action: {
                    if self.index > 0 {
                        self.index -= 1
                        if nextButtonDisabled {
                            nextButtonDisabled.toggle()
                        }
                        if self.index == 0 {
                            backButtonDisabled = true
                        }
                    } else {
                        backButtonDisabled.toggle()
                    }
                    playsound(soundName: array[self.index])
                }, label: {
                    Image(systemName: "chevron.backward.circle.fill")
                        .font(.system(size: 50))
                        .foregroundColor(backButtonDisabled ? .white : .red)
                })
                .disabled(backButtonDisabled)
                .hiddenConditionally(isHidden: backButtonDisabled)
                Spacer()
                Button(action: {
                    self.index = 0
                    backButtonDisabled = true
                    nextButtonDisabled = false
                    playsound(soundName: array[self.index])
                }, label: {
                    Image(systemName: "arrow.clockwise.circle.fill")
                        .font(.system(size: 70))
                        .foregroundColor(.blue)
                })
                Spacer()
                Button(action: {
                    if self.index < self.array.count - 1 {
                        self.index += 1
                        if  backButtonDisabled {
                            backButtonDisabled.toggle()
                        }
                        if self.index == self.array.count - 1 {
                            nextButtonDisabled.toggle()
                        }
                    } else {
                        nextButtonDisabled.toggle()
                    }
                    playsound(soundName: array[self.index])
                }, label: {
                    Image(systemName: "chevron.forward.circle.fill")
                        .font(.system(size: 50))
                        .foregroundColor(nextButtonDisabled ? .white : .green)
                })
                .disabled(nextButtonDisabled)
                .hiddenConditionally(isHidden: nextButtonDisabled)
            }.padding(50)
        }
        .onAppear(
            perform: {
                nextButtonDisabled = array.count <= 1 ? true : false
                playsound(soundName: array[self.index])
            })
    }
    
    func playsound(soundName: String) {
        let url = Bundle.main.url(forResource: soundName, withExtension: "wav")
        player = try! AVAudioPlayer(contentsOf: url!)
        player.play()
    }

}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(array: ["1"])
    }
}
