//
// String+Utils.swift
//
// This source file is part of the SMUD open source project
//
// Copyright (c) 2016 SMUD project authors
// Licensed under Apache License v2.0 with Runtime Library Exception
//
// See LICENSE.txt for license information
// See AUTHORS.txt for the list of SMUD project authors
//

import Foundation

extension String {
    public func forEachLine(handler: (_ line: String, _ stop: inout Bool) throws ->()) rethrows {
        let lines = replacingOccurrences(of: "\r\n", with: "\n")
            .replacingOccurrences(of: "\r", with: "\n")
            .components(separatedBy: "\n")
        var stop = false
        for line in lines {
            try handler(line, &stop)
            if stop {
                return
            }
        }
    }
    
    public func hasPrefix(_ prefix: String, caseInsensitive: Bool) -> Bool {
        if caseInsensitive {
            return nil != range(of: prefix,
                                options: [.caseInsensitive, .anchored])
        }
        return hasPrefix(prefix)
    }
    
    public func isPrefix(of string: String, caseInsensitive: Bool = false) -> Bool {
        return string.hasPrefix(self, caseInsensitive: caseInsensitive)
    }
    
    public func isPrefix(ofOneOf strings: [String], caseInsensitive: Bool = false) -> Bool {
        for item in strings {
            if isPrefix(of: item, caseInsensitive: caseInsensitive) {
                return true
            }
        }
        return false
    }
    
    public func isEqual(to string: String, caseInsensitive: Bool = false) -> Bool {
        switch caseInsensitive {
        case false: return self == string
        case true: return caseInsensitiveCompare(string) == .orderedSame
        }
    }
    
    public func isEqual(toOneOf strings: [String], caseInsensitive: Bool = false) -> Bool {
        for item in strings {
            if isEqual(to: item, caseInsensitive: caseInsensitive) {
                return true
            }
        }
        return false
    }

    public func droppingPrefix(count: Int = 1) -> String {
        return substring(from: index(startIndex, offsetBy: count))
    }
    
    public func droppingSuffix(count: Int = 1) -> String {
        return substring(to: index(endIndex, offsetBy: -count))
    }
    
    public func capitalizingFirstLetter() -> String {
        let first = String(characters.prefix(1)).capitalized
        let other = String(characters.dropFirst())
        return first + other
    }
    
    public mutating func capitalizeFirstLetter() {
        self = self.capitalizingFirstLetter()
    }
}

