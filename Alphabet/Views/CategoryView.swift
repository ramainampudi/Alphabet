//
//  CategoryView.swift
//  Alphabet
//
//  Created by Rama Krishna Inampudi on 26/11/20.
//

import SwiftUI

struct CategoryView: View {
    let category: Category
    var body: some View {
        VStack {
            Image(category.imageURL)
                .resizable()
                .scaledToFit()
//                .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, height: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                .cornerRadius(20)
                .padding(.leading)
                .padding(.trailing)
            Text(category.name)
                .font(.title2)
                .padding(.bottom)
        }
        .padding(5)
    }
}

struct CategoryView_Previews: PreviewProvider {
    static var previews: some View {
        CategoryView(category: Category(name: "abc", imageURL: "abc", values: ["A"], sounds: ["A"]))
    }
}
