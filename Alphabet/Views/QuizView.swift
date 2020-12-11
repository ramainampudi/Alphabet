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
            VStack(alignment: .trailing) {
                HStack {
                    Text("Score: \(self.score)")
                        .font(.title3)
                        .padding(20)
                }
                Spacer()
                Button(action: {
                    category.playName(soundName: category.sounds[self.correctIndex])
                }, label: {
                    ZStack {
                        Image(systemName: "speaker.wave.2.circle.fill")
                            .font(.system(size: 100))
                            .foregroundColor(Color("bgColor"))
                    }
                    .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
                    .background(RoundedRectangle(cornerRadius: 15.0, style: .continuous)
                                    .frame(alignment: .center)
                                    .foregroundColor(.purple))
                    .padding(20)
                })
                Spacer()
                HStack  {
                    Button(action: {
                        let index = self.correctIndex < self.otherIndex ? self.correctIndex : self.otherIndex
                        checkAnswer(index, self.correctIndex, self.category)
                    }, label: {
                        Text(category.values[self.correctIndex < self.otherIndex ? self.correctIndex : self.otherIndex])
                            .padding()
                            .font(.system(size: 100))
                            .foregroundColor(.white)
                            .background(
                                RoundedRectangle(cornerRadius: 15.0, style: .continuous)
                                    .frame(alignment: .center)
                                    .foregroundColor(.blue))
                            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
                    })
                    .disabled(self.buttonDisable)
                    
                    Button(action: {
                        let index = self.correctIndex > self.otherIndex ? self.correctIndex : self.otherIndex
                        checkAnswer(index, self.correctIndex, self.category)
                    }, label: {
                        Text(category.values[self.correctIndex > self.otherIndex ? self.correctIndex : self.otherIndex])
                            .padding()
                            .font(.system(size: 100))
                            .foregroundColor(.white)
                            .background(
                                RoundedRectangle(cornerRadius: 15.0, style: .continuous)
                                    .frame(alignment: .center)
                                    .foregroundColor(.blue))
                            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
                    })
                    .disabled(self.buttonDisable)
                }
                Spacer()
                Button(action: {
                    setIndex()
                }, label: {
                    Text("Next")
                        .font(.title2)
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity, alignment: .center)
                        .padding()
                        .background(LinearGradient(gradient: Gradient(colors: [Color("LightBlue"), Color("DarkBlue")]), startPoint: .leading, endPoint: .trailing ))
                        .cornerRadius(15)
                        .padding(.horizontal, 20)
                })
            }
            .navigationBarTitle("\(category.name) Quiz", displayMode: .inline)
            .background((self.showCorrect ? .green : self.showIncorrect ? .orange : Color("bgColor")).edgesIgnoringSafeArea(.bottom))
            .onAppear(perform: {
                setIndex()
            })
        } else {
            ResultsView(score: self.score, categoryName: category.name, totalNoOfQs: self.count - 1)
        }
    }
    
    func checkAnswer(_ index: Int, _ correctIndex: Int, _  category:  Category) {
        if index == correctIndex {
            self.score += 1
            showCorrect.toggle()
            category.playName(soundName: "That's right!")
        } else {
            showIncorrect.toggle()
            category.playName(soundName: "Oh! That's Wrong.")
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
        self.category.playName(soundName: category.sounds[self.correctIndex])
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
