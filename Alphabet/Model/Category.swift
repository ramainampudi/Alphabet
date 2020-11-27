//
//  Learn.swift
//  Alphabet
//
//  Created by Rama Krishna Inampudi on 26/11/20.
//

import Foundation
struct Category {
    var name: String
    var imageURL: String
    var value: [String]
}

extension Category {
    static func all() -> [Category] {
        return [
            Category(name: "Alphabets", imageURL: "abc", value: [
                "A", "B", "C", "D", "E", "F", "G", "H", "I", "J",
                "K", "L", "M", "N", "O", "P", "Q", "R", "S", "T",
                "U", "V", "W", "X", "Y", "Z"
            ]),
            Category(name: "Numbers", imageURL: "123", value: [
                "0", "1", "2", "3", "4", "5", "6", "7", "8", "9", "10",
                "11", "12", "13", "14", "15", "16", "17", "18", "19", "20"
            ])
        ]
    }

}
