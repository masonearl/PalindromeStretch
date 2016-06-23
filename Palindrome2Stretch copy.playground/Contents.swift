//: Playground - noun: a place where people can play

import UIKit

func isPalindrome(palindrome: String) -> Bool {
    
    if (palindrome == "" || palindrome.characters.count == 1){
        return true
    }
    else {
        if palindrome.characters.first == palindrome.characters.last {
            return isPalindrome(palindrome.substringWithRange(palindrome.startIndex.successor() ..< palindrome.endIndex.predecessor()))
        } else {
            return false
        }
    }
}

extension String {
    var lettersOnly: String {
        return componentsSeparatedByCharactersInSet(NSCharacterSet.letterCharacterSet().invertedSet).joinWithSeparator("")
    }
    var possiblePalindrome: Bool {
        return lettersOnly.lowercaseString == lettersOnly.lowercaseString
    }
    var words: [String] {
        return
            componentsSeparatedByCharactersInSet(.punctuationCharacterSet())
                .joinWithSeparator("").componentsSeparatedByString(" ").filter{!$0.isEmpty}
    }
}

func checkPalindrome(palindrome: String) -> Bool {
    let chars = Array(palindrome.lettersOnly.lowercaseString.characters)
    for index in 0..<chars.count/2 {
        if chars[index] != chars[chars.count.predecessor() - index] {
            return false
        }
    }
    return true
}

"Dammit im mad!".possiblePalindrome
"Socorram=me subi no onibus em marrocos".possiblePalindrome
"Go hang a salomi im a lasagna hog".possiblePalindrome

isPalindrome("Dammit im mad")
isPalindrome("dammitimmad")
isPalindrome("racecar")
isPalindrome("Illuminati")
isPalindrome("Radar")
isPalindrome("borrow or rob")

