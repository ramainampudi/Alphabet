//
//  ContentView.swift
//  Alphabet
//
//  Created by Rama Krishna Inampudi on 24/11/20.
//

import SwiftUI

struct ContentView: View {
    
    let categories = Category.all().sorted {
        $0.name < $1.name
    }
    
    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    var body: some View {
        NavigationView {
            //            List(self.categories, id: \.name) {category in
            //                NavigationLink(
            //                    destination: DetailView(category: category),
            //                    label: {
            //                        CategoryView(category: category)
            //                    })
            //            }
            ScrollView {
                LazyVGrid(columns: columns, content: {
                    ForEach(self.categories, id: \.self) {category in
                        NavigationLink(
                            destination: DetailView(category: category),
                            label: {
                                CategoryView(category: category)
                            })
                            .buttonStyle(PlainButtonStyle())
                    }
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

