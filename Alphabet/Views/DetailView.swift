//
//  detailView.swift
//  Alphabet
//
//  Created by Rama Krishna Inampudi on 25/11/20.
//

import SwiftUI
import AVFoundation

struct DetailView: View {
    
    let category: Category
    @State private var index = 0
    @State private var buttonDisabled = false
    @State private var backButtonDisabled = true
    @State private var nextButtonDisabled = false
    @State var player: AVAudioPlayer!
    
    var body: some View {
        VStack {
            Spacer()
            ZStack {
                if category.name.contains("Alphabets")
                    || category.name.contains("Numbers") {
                    Text(category.values[self.index])
                        .font(.system(size: (UIScreen.main.bounds.width - (category.values[self.index] == "Mm" || category.values[self.index] == "Ww" ? 150 : 120)) / CGFloat(Double(category.values[self.index].count) > 1 ? Double(category.values[self.index].count) * 0.6 : Double(category.values[self.index].count))))
                        .foregroundColor(.white)
                        .background(
                            RoundedRectangle(cornerRadius: 15.0, style: .continuous)
                                .frame(width: UIScreen.main.bounds.width - 40, height: 350, alignment: .center)
                                .foregroundColor(.init(red: Double.random(in: 0...0.7), green: Double.random(in: 0...0.7), blue: Double.random(in: 0...0.7)))
                        )
                } else {
                    Text(category.values[self.index])
                        .font(.system(size: (UIScreen.main.bounds.width - 120) / CGFloat(Double(category.values[self.index].count) > 1 ? Double(category.values[self.index].count) * 0.6 : Double(category.values[self.index].count))))
                        .foregroundColor(.white)
                }
            }.onTapGesture {
                category.playName(soundName: category.sounds[self.index])
            }
            Spacer()
            if !category.name.contains("Alphabets")
                && !category.name.contains("Numbers") {
                Text(category.sounds[self.index])
                    .font(.system(size: 20))
                Spacer()
            }
        
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
                    category.playName(soundName: category.sounds[self.index])
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
                    nextButtonDisabled = (self.index == self.category.values.count - 1) ? true : false
                    category.playName(soundName: category.sounds[self.index])
                }, label: {
                    Image(systemName: "arrow.clockwise.circle.fill")
                        .font(.system(size: 52))
                        .foregroundColor(.blue)
                })
                Spacer()
                if category.name.contains("Animals") {
                    Button(action: {
                        playSound(soundName: category.sounds[self.index], type: "m4a")
                    }, label: {
                        Image(systemName: "speaker.wave.2.circle.fill")
                            .font(.system(size: 52))
                            .foregroundColor(.orange)
                    })
                    Spacer()
                }
                Button(action: {
                    if self.index < self.category.values.count - 1 {
                        self.index += 1
                        if  backButtonDisabled {
                            backButtonDisabled.toggle()
                        }
                        if self.index == self.category.values.count - 1 {
                            nextButtonDisabled.toggle()
                        }
                    } else {
                        nextButtonDisabled.toggle()
                    }
                    category.playName(soundName: category.sounds[self.index])
                }, label: {
                    Image(systemName: "chevron.forward.circle.fill")
                        .font(.system(size: 50))
                        .foregroundColor(nextButtonDisabled ? .white : .green)
                })
                .disabled(nextButtonDisabled)
                .hiddenConditionally(isHidden: nextButtonDisabled)
            }.padding(50)
            .padding(.bottom, 100)
        }
        .onAppear(
            perform: {
                nextButtonDisabled = category.values.count <= 1 ? true : false
                category.playName(soundName: category.sounds[self.index])
            })
        .navigationBarTitle(category.name, displayMode: .inline)
        .navigationBarItems(trailing: NavigationLink(
                                destination: QuizView(category: category),
                                label: {
                                    Text("Quiz")
                                }))
    }
    
    func playSound(soundName: String, type: String) {
        if let url = Bundle.main.url(forResource: soundName, withExtension: type) {
            do {
                try AVAudioSession.sharedInstance().setCategory(.playback)
            } catch(let error) {
                print(error.localizedDescription)
            }
            player = try! AVAudioPlayer(contentsOf: url)
            player.play()
        }
    }
    
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(category: Category(name: "1", imageURL: "1", values: ["1"], sounds: ["1"]))
    }
}
