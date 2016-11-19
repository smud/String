import XCTest
@testable import StringUtils

class StringUtilsTests: XCTestCase {
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        //XCTAssertEqual(StringUtils().text, "Hello, World!")
    }


    static var allTests : [(String, (StringUtilsTests) -> () throws -> Void)] {
        return [
            ("testExample", testExample),
        ]
    }
}
