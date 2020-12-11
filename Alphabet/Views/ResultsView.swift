//
//  ResultsView.swift
//  Alphabet
//
//  Created by Rama Krishna Inampudi on 10/12/20.
//

import SwiftUI

struct ResultsView: View {
    var score: Int
    var categoryName: String
    var totalNoOfQs: Int
    
    var body: some View {
        VStack {
            Text(score > 6 ? "Congratulations!" : "Try hard..")
                .font(.largeTitle)
                .fontWeight(.bold)
                .padding()
            VStack {
                Text("\(score)")
                    .font(.largeTitle)
                Divider()
                    .background(Color.black)
                    .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, height: 3,alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                Text("\(totalNoOfQs)")
                    .font(.largeTitle)
            }
            .background(
                Circle()
                    .fill(Color.clear)
                    .frame(width: 140, height: 140, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                    .overlay(Circle().stroke(lineWidth: 2))
            )
            .padding()
        }.navigationBarTitle("\(categoryName) Quiz")
        .frame(maxWidth: .infinity, maxHeight: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
        .background(score > 6 ? Color.yellow : Color.orange)
        .edgesIgnoringSafeArea(.bottom)
    }
}

struct ResultsView_Previews: PreviewProvider {
    static var previews: some View {
        ResultsView(score: 1, categoryName: "Test", totalNoOfQs: 2)
    }
}
