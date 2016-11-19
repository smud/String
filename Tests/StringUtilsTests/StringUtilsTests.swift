import XCTest
@testable import StringUtils

class StringUtilsTests: XCTestCase {
    //func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        //XCTAssertEqual(StringUtils().text, "Hello, World!")
    //}

    func testForEachLine() {
        equalToLines("", [""])
        equalToLines("\r", ["", ""])
        equalToLines("\n", ["", ""])
        equalToLines("\r\n", ["", ""])
        
        equalToLines("a", ["a"])
        equalToLines("a\r", ["a", ""])
        equalToLines("a\n", ["a", ""])
        equalToLines("a\r\n", ["a", ""])
        
        equalToLines("a\rb", ["a", "b"])
        equalToLines("a\nb", ["a", "b"])
        equalToLines("a\r\nb", ["a", "b"])
        
        equalToLines("a\nb\r", ["a", "b", ""])
        equalToLines("a\nb\n", ["a", "b", ""])
        equalToLines("a\nb\r\n", ["a", "b", ""])
        
        equalToLines("a\r\rb", ["a", "", "b"])
        equalToLines("a\n\nb", ["a", "", "b"])
        equalToLines("a\r\n\r\nb", ["a", "", "b"])
        equalToLines("a\r\r\nb", ["a", "", "b"])
        equalToLines("a\r\n\nb", ["a", "", "b"])
        
        equalToLines("\r\r", ["", "", ""])
        equalToLines("\n\n", ["", "", ""])
        equalToLines("\r\n\r\n", ["", "", ""])
        equalToLines("\r\r\n", ["", "", ""])
        equalToLines("\r\n\n", ["", "", ""])
    }

    func printLines(_ text: String) {
        var i = 0
        print("\n[\(text.debugDescription)]")
        text.forEachLine { line, stop in
            print("\(i): \(line.debugDescription)")
            i += 1
        }
    }
    
    func equalToLines(_ text: String, _ lines: [String]) {
        printLines(text)
        
        var i = 0
        text.forEachLine { line, stop in
            XCTAssertTrue(i < lines.count)
            if i < lines.count {
                XCTAssertEqual(line, lines[i])
            }
            i += 1
        }
        XCTAssertTrue(i == lines.count)
    }

    static var allTests : [(String, (StringUtilsTests) -> () throws -> Void)] {
        return [
            //("testExample", testExample),
            ("testForEachLine", testForEachLine),
        ]
    }
}
