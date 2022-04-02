//
//  ClassMarks.swift
//
//  Created by Layla Michel
//  Created on 2022-03-31
//  Version 1.0
//  Copyright (c) 2022 IMH. All rights reserved.
//
//  This program reads a file and creates a new file
//  with the reversed strings of the original file.

import Foundation

var reversedArray: [String] = []

func reverse(strings: String) -> String {
    var str = ""
    // Add each character of the string into a
    // new variable in reverse order
    for char in strings {
        str = "\(char)" + str
    }

    return str
}

do {
    if CommandLine.argc < 2 {
        // Message if no file is inputted
        print("Error: Text file needed.")
    } else {
        // Read command line arguments for file name
        let arguments = CommandLine.arguments
        let file: String = arguments[1]

        let set = try String(contentsOfFile: file, encoding: String.Encoding.utf8)
        let charsArray: [String] = set.components(separatedBy: "\n")

        var counter = 0
        // Put each string in the array in the reverse function
        // and insert it to the reverseArray
        for chars in charsArray {
            reversedArray.insert(reverse(strings: chars), at: counter)
            counter += 1
        }

        let joined = reversedArray.joined(separator: "\n")
        let saveToPath = "/home/runner/Unit2-01-Swift/output.txt"

        do {
            // Put reversed array into new file
            try joined.write(toFile: saveToPath, atomically: true, encoding: String.Encoding.utf8)
        } catch {
            print("Error with 'output.txt'")
        }

        print("Marks added to 'output.txt'")
    }
} catch {
    // Error message if nonexistent file is inputted
    Swift.print("File does not exist.")
}
