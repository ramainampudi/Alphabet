//
//  ContentView.swift
//  Alphabet
//
//  Created by Rama Krishna Inampudi on 24/11/20.
//

import SwiftUI

struct ContentView: View {
    
    let categories = Category.all()
    
    var body: some View {
        NavigationView {
            List(self.categories, id: \.name) {category in
                NavigationLink(
                    destination: DetailView(category: category),
                    label: {
                        CategoryView(category: category)
                    })
            }
            .navigationTitle("Learny")
        }
    }
}

extension View {
    func hiddenConditionally(isHidden: Bool) -> some View {
        isHidden ? AnyView(self.hidden()) : AnyView(self)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

