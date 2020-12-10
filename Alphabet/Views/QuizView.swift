//
//  QuizView.swift
//  Alphabet
//
//  Created by Rama Krishna Inampudi on 02/12/20.
//

import SwiftUI
import AVFoundation

struct QuizView: View {
    
    let category: Category
    @State private var num: Bool = true
    @State private var correctIndex: Int = 0
    @State private var count: Int = 0
    @State private var otherIndex: Int = 0
    @State private var score: Int  = 0
    @State private var buttonDisable: Bool = false
    @State private var showCorrect: Bool = false
    @State private var showIncorrect: Bool = false
    
    var body: some View {
        if self.count <= 10 {
            VStack {
                HStack {
                    Spacer()
                    Text("Score: \(self.score)")
                        .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, height: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, alignment: .trailing)
                        .padding(.trailing, 50)
                }
                Spacer()
        
                Button(action: {
                    playName(soundName: category.sounds[self.correctIndex])
                }, label: {
                    Image(systemName: "speaker.wave.2.circle.fill")
                        .font(.system(size: 100))
                        .foregroundColor(.purple)
                })
                Spacer()
                HStack  {
                    Button(action: {
                        let index = self.correctIndex < self.otherIndex ? self.correctIndex : self.otherIndex
                        checkAnswer(index, self.correctIndex)
                    }, label: {
                        Text(category.values[self.correctIndex < self.otherIndex ? self.correctIndex : self.otherIndex])
                            .padding()
                            .font(.system(size: 100))
                            .foregroundColor(.white)
                            .background(
                                RoundedRectangle(cornerRadius: 15.0, style: .continuous)
                                    .frame(alignment: .center)
                                    .foregroundColor(.blue))
                    }).padding()
                    .disabled(self.buttonDisable)

                    Button(action: {
                        let index = self.correctIndex > self.otherIndex ? self.correctIndex : self.otherIndex
                        checkAnswer(index, self.correctIndex)
                    }, label: {
                        Text(category.values[self.correctIndex > self.otherIndex ? self.correctIndex : self.otherIndex])
                            .padding()
                            .font(.system(size: 100))
                            .foregroundColor(.white)
                            .background(
                                RoundedRectangle(cornerRadius: 15.0, style: .continuous)
                                    .frame(alignment: .center)
                                    .foregroundColor(.blue))
                    }).padding()
                    .disabled(self.buttonDisable)
                }
                
                Spacer()
                Button(action: {
                    setIndex()
                }, label: {
                    Text("Next")
                        .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                }).padding()
            }
            .navigationBarTitle("\(category.name) Quiz", displayMode: .inline)
            .background(self.showCorrect ? .green : self.showIncorrect ? .orange : Color("bgColor"))
            .onAppear(perform: {
                setIndex()
            })
        } else {
            VStack {
                Text(self.score > 6 ? "Congratulations!" : "Try hard")
                    .font(.largeTitle)
                Text("Final Score: \(self.score) of \(self.count - 1)")
                    .font(.title)
                    .navigationBarTitle("\(category.name) Quiz")
                    .padding()
            }
        }
    }
    
    func playName(soundName: String) {
        do {
            try AVAudioSession.sharedInstance().setCategory(.playback)
        } catch(let error) {
            print(error.localizedDescription)
        }
        let utterance = AVSpeechUtterance(string: soundName)
        utterance.voice = AVSpeechSynthesisVoice(language: "en-US")
        utterance.rate = 0.4
        let synthesizer = AVSpeechSynthesizer()
        synthesizer.speak(utterance)
    }
    
    func checkAnswer(_ index: Int, _ correctIndex: Int) {
        if index == correctIndex {
            self.score += 1
            showCorrect.toggle()
            playName(soundName: "That's right!")
        } else {
            showIncorrect.toggle()
            playName(soundName: "Oh! That's Wrong.")
        }
        self.buttonDisable = true
    }
    
    func setIndex() {
        self.buttonDisable = false
        self.showCorrect = false
        self.showIncorrect = false
        self.count += 1
        if self.count > 10 {
            return
        }
        self.correctIndex = Int.random(in: 0 ..< self.category.values.count)
        playName(soundName: category.sounds[self.correctIndex])
        self.num = true
        while self.num {
            self.otherIndex = Int.random(in: 0 ..< self.category.values.count)
            if self.correctIndex != self.otherIndex {
                self.num = false
            }
        }
    }
}

struct QuizView_Previews: PreviewProvider {
    static var previews: some View {
        QuizView(category: Category(name: "abc", imageURL: "abc", values: ["A"], sounds: ["A"]))
    }
}
