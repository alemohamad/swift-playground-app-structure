import XCTest
@testable import ExampleKit

class AppModuleTests: XCTestCase {
    func testAddition() {
        let result = 5 + 3
        XCTAssertEqual(result, 8, "Addition should equal")
    }
    
    func testPerson() {
        let person = Person(name: "Alejandro", dateOfBirth: Date())
        XCTAssertEqual(person.name, "Alejandro")
    }
}
