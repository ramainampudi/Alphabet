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
                .cornerRadius(20)
                .padding(.horizontal)
                .padding(.top)
            Text(category.name)
                .font(.title2)
        }
        .padding(5)
    }
}

struct CategoryView_Previews: PreviewProvider {
    static var previews: some View {
        CategoryView(category: Category(name: "abc", imageURL: "abc", values: ["A"], sounds: ["A"]))
    }
}
