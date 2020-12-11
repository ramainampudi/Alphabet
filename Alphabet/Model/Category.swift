//
//  Learn.swift
//  Alphabet
//
//  Created by Rama Krishna Inampudi on 26/11/20.
//

import Foundation
import AVFoundation
struct Category: Hashable {
    var name: String
    var imageURL: String
    var values: [String]
    var sounds: [String]
}

extension Category {
    static func all() -> [Category] {
        return [
            Category(name: "Alphabets", imageURL: "abc", values: [
                "Aa", "Bb", "Cc", "Dd", "Ee", "Ff", "Gg", "Hh", "Ii", "Jj",
                "Kk", "Ll", "Mm", "Nn", "Oo", "Pp", "Qq", "Rr", "Ss", "Tt",
                "Uu", "Vv", "Ww", "Xx", "Yy", "Zz"
            ], sounds: [
                "a", "b", "c", "d", "e", "f", "g", "h", "i", "j",
                "k", "l", "m", "n", "o", "p", "q", "r", "s", "t",
                "u", "v", "w", "x", "y", "z"
            ]),
            
            Category(name: "Numbers", imageURL: "123", values: [
                "0", "1", "2", "3", "4", "5", "6", "7", "8", "9", "10",
                "11", "12", "13", "14", "15", "16", "17", "18", "19", "20",
                "21", "22", "23", "24", "25", "26", "27", "28", "29", "30",
                "31", "32", "33", "34", "35", "36", "37", "38", "39", "40",
                "41", "42", "43", "44", "45", "46", "47", "48", "49", "50",
                "51", "52", "53", "54", "55", "56", "57", "58", "59", "60",
                "61", "62", "63", "64", "65", "66", "67", "68", "69", "70",
                "71", "72", "73", "74", "75", "76", "77", "78", "79", "80",
                "81", "82", "83", "84", "85", "86", "87", "88", "89", "90",
                "91", "92", "93", "94", "95", "96", "97", "98", "99", "100"
            ], sounds: [
                "0", "1", "2", "3", "4", "5", "6", "7", "8", "9", "10",
                "11", "12", "13", "14", "15", "16", "17", "18", "19", "20",
                "21", "22", "23", "24", "25", "26", "27", "28", "29", "30",
                "31", "32", "33", "34", "35", "36", "37", "38", "39", "40",
                "41", "42", "43", "44", "45", "46", "47", "48", "49", "50",
                "51", "52", "53", "54", "55", "56", "57", "58", "59", "60",
                "61", "62", "63", "64", "65", "66", "67", "68", "69", "70",
                "71", "72", "73", "74", "75", "76", "77", "78", "79", "80",
                "81", "82", "83", "84", "85", "86", "87", "88", "89", "90",
                "91", "92", "93", "94", "95", "96", "97", "98", "99", "100"
            ]),
            
            Category(name: "Farm Animals", imageURL: "farm", values: [
                "🐃", "🐈", "🐥", "🐄", "🐕", "🦆", "🐐", "🐎", "🦙",
                "🐂", "🐖", "🐩", "🐇", "🐏", "🐓", "🐑", "🦃"
            ], sounds: [
                "Buffalo", "Cat", "Chicken", "Cow", "Dog", "Duck", "Goat", "Horse", "Llama",
                "Ox", "Pig", "Poodle", "Rabbit", "Ram", "Rooster", "Sheep", "Turkey"
            ]),
            
            Category(name: "Forest Animals", imageURL: "forest", values: [
                "🐻", "🦫", "🦬", "🐗", "🦌", "🦔", "🐨", "🦎", "🐒",
                "🐁", "🦦", "🐼", "🐆", "🦝", "🦂", "🦥", "🐌",
                "🐿", "🐺", "🪱"
            ], sounds: [
                "Bear", "Beaver", "Bison", "Boar", "Deer", "Hedgehog", "Koala", "Lizard", "Monkey",
                "Mouse", "Otter", "Panda", "Panther", "Raccoon", "Scorpion", "Sloth", "Snail",
                "Squirrel or Chipmunk", "Wolf", "Worm"
            ]),
            
            Category(name: "Jungle Animals", imageURL: "jungle", values: [
                "🦇", "🦕", "🐘", "🦒", "🦍", "🐹", "🦘", "🐆",
                "🦁", "🦧", "🦏", "🐍", "🐅", "🦓"
            ], sounds: [
                "Bat", "Dinosaur", "Elephant", "Giraffee", "Gorilla", "Hamster", "Kangaroo", "Leopard",
                "Lion", "Orangutan", "Rhinoceros", "Snake", "Tiger", "Zebra"
            ]),
            
            Category(name: "Aquatic Animals", imageURL: "aqua", values: [
                "🐊", "🐡", "🦀", "🐬", "🐟", "🐸", "🦛",
                "🦞", "🐙", "🦭", "🦈", "🦐", "🐳",
                "🦑", "🐠", "🐢", "🐋"
            ], sounds: [
                "Alligator", "Blowfish", "Crab", "Dolphin", "Fish", "Frog", "Hippopotamus",
                "Lobster", "Octopus", "Seal", "Shark", "Shrimp", "Spouting Whale",
                "Squid", "Tropical Fish", "Turtle", "Whale"
            ]),
            
            Category(name: "Desert Animals", imageURL: "desert", values: [
                "🦡", "🐪", "🐫", "🦊", "🦨"
            ], sounds: [
                "Badger", "Camel", "Double Humped Camel", "Fox", "Skunk"
            ]),
            
            Category(name: "Insects", imageURL: "insect", values: [
                "🐜", "🪲", "🐛", "🦋", "🪳",
                "🦗", "🪰", "🐝", "🐞", "🦟", "🕷"
            ], sounds: [
                "Ant", "Beetle", "Bug", "Butterfly", "Cockroach",
                "Cricket", "Fly", "Honey Bee", "Ladybug", "Mosquito", "Spider"
            ]),
            
            Category(name: "Birds", imageURL: "bird", values: [
                "🦤", "🕊", "🦅", "🦩", "🦉",
                "🦜", "🦚", "🐧", "🐓", "🦢"
            ], sounds: [
                "Dodo Bird", "Dove", "Eagle", "Flamingo", "Owl",
                "Parrot", "Peacock", "Penguin", "Rooster", "Swan"
            ]),
            
            Category(name: "Body Parts", imageURL: "body", values: [
                "💪", "🦴", "🧠", "👂", "👁️",
                "🦶", "🫀", "🦵", "🫁", "👄",
                "👃", "👅", "🦷"
            ], sounds: [
                "Hand", "Bone", "Brain", "Ear", "Eye",
                "Foot", "Heart", "Leg", "Lungs", "Mouth",
                "Nose", "Tongue", "Tooth"
            ]),
            
            Category(name: "Professions", imageURL: "prof", values: [
                "🧑‍🎨", "🧑‍🚀", "🤡", "🧑‍🚒", "🧑‍🍳", "🕵️",
                "🧑‍⚕️", "🧑‍🏭", "🧑‍🌾", "🧑‍🚒", "💂",
                "🧑‍⚖️", "🤹‍♂️", "🧙", "🧑‍🔧", "🥷", "🧑🏻‍💼",
                "🧑‍✈️", "👮", "🤴", "👸", "🧑‍💻",
                "🎅", "🧑‍🔬", "🧑‍🎤", "🧑‍🎓", "🧑‍🏫"
            ], sounds: [
                "Artist", "Astronaut", "Clown", "Construction Worker", "Cook", "Detective",
                "Doctor", "Factory Worker", "Farmer", "Firefighter", "Guard",
                "Judge", "Juggler", "Magician", "Mechanic", "Ninja Warrior", "Office Worker",
                "Pilot", "Police Officer", "Prince", "Princess", "Programmer",
                "Santa Claus", "Scientist", "Singer", "Student", "Teacher"
            ]),
            
            Category(name: "Fantasy", imageURL: "fantasy", values: [
                "👽", "🐉", "🧝", "🧚", "🧞", "👺", "👻", "🧜‍♀️",
                "👹", "🧙", "🦸", "🦹", "🦄", "🧛🏻‍♂️", "🧟‍♂️"
            ], sounds: [
                "Alien", "Dragon", "Elf", "Fairy", "Genie", "Goblin", "Ghost", "Mermaid",
                "Ogre", "Sorcerer", "Superhero", "Supervillain", "Unicorn", "Vampire", "Zombie"
            ]),
            
            Category(name: "Music", imageURL: "music", values: [
                "🪗", "🥁", "🎧", "🎸", "🪘",
                "🎤", "🎹", "🎷", "🎺", "🎻"
            ], sounds: [
                "Accordion", "Drum", "Headphone", "Guitar", "Long Drum",
                "Microphone", "Musical Keyboard", "Saxophone", "Trumpet",
                "Violin"
            ]),
            
            Category(name: "Sports", imageURL: "sport", values: [
                "🏈", "🏹", "🏸", "⚾", "🏀",
                "🏍", "🎳", "🥊", "🏎", "♟️",
                "🧗", "🏏", "🥌", "🚴", "🎯", "🤺",
                "🥏", "⚽", "🎲", "🏌️", "🤸", "🤾",
                "🏑", "🏇", "🏒", "🥍", "🚵",
                "🏓", "🎱", "🛼", "🚣", "🏉", "🏃🏻", "🛹",
                "⛷️", "🛷", "🏂", "🥎", "🏄", "🏊",
                "🥋", "🎾", "🏐", "🤽", "🏋️", "🤼"
            ], sounds: [
                "American Football", "Archery", "Badminton", "Baseball", "Basketball",
                "Motor Bike Racing", "Bowling", "Boxing", "Car Racing", "Chess",
                "Climbing", "Cricket", "Curling", "Cycling", "Darts", "Fencing",
                "Flying Disc", "Football", "Game Dice", "Golf", "Gymnastics", "Handball",
                "Hockey", "Horse Racing", "Ice Hockey", "Lacrosse", "Mountain Biking",
                "Table Tennis", "Pool 8 Ball", "Roller Skate", "Rowing", "Rugby", "Running", "Skateboard",
                "Skiing", "Sledding", "Snowboarding", "Softball", "Surfing", "Swimming",
                "Taekwondo", "Tennis", "Volleyball", "Water Polo", "Weightlifting", "Wrestling"
            ]),
            
            Category(name: "Vehicles", imageURL: "vehicle", values: [
                "🚡", "✈️", "🚑", "🛺",
                "🚲", "🚅", "🚌", "🚗", "⛴️", "🚒",
                "🛸", "🚁", "🚄", "🛴", "🚈",
                "🚂", "🚛", "🚇", "🚐", "🚝", "🛥️", "🛵",
                "🏍️", "🚠", "🚞", "🪂", "🛳️",
                "🛻", "🚓", "🏎️", "🚃", "🚀", "⛵",
                "🛰️", "🚢", "🛩️", "🚤", "🚙",
                "🚟", "🚕", "🚜", "🚆", "🚊", "🚋", "🚎",
                "🚚"
            ], sounds: [
                "Aerial Tramway", "Airplane", "Ambulance", "Auto Rickshaw",
                "Bicycle", "Bullet Train", "Bus", "Car", "Ferry", "Fire Engine",
                "Flying Saucer", "Helicopter", "High-Speed Train", "Kick Scooter", "Light Rail",
                "Locomotive", "Lorry", "Metro", "Minibus", "Monorail", "Motor Boat", "Motor Scooter",
                "Motorcycle", "Mountain Cableway", "Mountain Railway", "Parachute", "Passenger Ship",
                "Pickup Truck", "Police Car", "Racing Car", "Railway Car", "Rocket", "Sailboat",
                "Satellite", "Ship", "Small Airplane", "Speedboat", "Sport Utility Vehicle",
                "Suspension Railway", "Taxi", "Tractor", "Train", "Tram", "Tram Car", "Trolleybus",
                "Truck"
            ]),
            
            Category(name: "Fruits & Nuts", imageURL: "fruit", values: [
                "🥑", "🍌", "🫐", "🍒", "🌰", "🥥", "🍇",
                "🍏", "🥝", "🍋", "🥭", "🍈", "🫒", "🍊", "🍑",
                "🥜", "🍐", "🍍", "🍎", "🍓", "🍉"
            ], sounds: [
                "Avocado", "Banana", "Blueberries", "Cherries", "Chestnut", "Coconut", "Grapes",
                "Green Apple", "Kiwi Fruit", "Lemon", "Mango", "Melon", "Olive", "Orange", "Peach",
                "Peanuts", "Pear", "Pineapple", "Red Apple", "Strawberry", "Watermelon"
            ]),
            
            Category(name: "Vegetables", imageURL: "veg", values: [
                "🫑", "🥦", "🥕", "🌽", "🥒", "🍆", "🧄",
                "🥬", "🍄", "🧅", "🥔", "🌶️", "🍠", "🍅"
            ], sounds: [
                "Bell Pepper", "Broccoli", "Carrot", "Corn", "Cucumber", "Eggplant", "Garlic",
                "Leafy Green", "Mushroom", "Onion", "Potato", "Red Chilli", "Sweet Potato", "Tomato"
            ]),
            
            Category(name: "Food", imageURL: "food", values: [
                "🥓", "🥯", "🥖", "🎂", "🍞",
                "🌯", "🧈", "🍬", "🥫", "🧀", "🍫",
                "☕", "🍪", "🥐", "🧁", "🍛",
                "🍮", "🍡", "🍩", "🥟", "🥚", "🧆", "🍥",
                "🫓", "🫕", "🥠", "🍟", "🍤",
                "🥗", "🍵", "🍔", "🍯", "🌭", "🍨",
                "🍭", "🍱", "🥩", "🍖", "🥛", "🥮", "🍜",
                "🍢", "🍳", "🦪", "🥞", "🥧", "🍕", "🍿",
                "🍗", "🥨", "🍚", "🍘", "🧂", "🥪", "🍧",
                "🍰", "🍦", "🍲", "🍝", "🥙", "🍣",
                "🌮", "🫔", "🧇"
            ], sounds: [
                "Bacon", "Bagel", "Baguette", "Birthday Cake", "Bread",
                "Burrito", "Butter", "Candy", "Canned Food", "Cheese", "Chocolate",
                "Coffee", "Cookie", "Croissant", "Cupcake", "Curry & Rice",
                "Custard", "Dango", "Doughnut", "Dumpling", "Egg", "Falafel", "Fish Cake",
                "Flatbread", "Fondue", "Fortune Cookie", "French Fries", "Fried Prawn",
                "Green Salad", "Green Tea", "Hamburger", "Honey", "Hot Dog", "Ice Cream",
                "Lollipop", "Lunch Box", "Meat", "Meat on Bone", "Milk", "Moon Cake", "Noodles",
                "Oden",  "Omlette", "Oyster", "Pancakes", "Pie", "Pizza", "Popcorn",
                "Poultry Leg", "Pretzel", "Rice", "Rice Cracker", "Salt", "Sandwich", "Shaved Ice",
                "Shortcake", "Soft Ice Cream", "Soup", "Spaghetti", "Stuffed Flatbread", "Sushi",
                "Taco", "Tamale", "Waffle"
            ])
        ]
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

}
