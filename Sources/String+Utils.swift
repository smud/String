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
    
    public func droppingPrefix(count: Int = 1) -> String {
        return substring(from: index(startIndex, offsetBy: count))
    }
    
    public func droppingSuffix(count: Int = 1) -> String {
        return substring(to: index(endIndex, offsetBy: -count))
    }
}

