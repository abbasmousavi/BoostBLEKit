import XCTest
@testable import BoostBLEKit

class BoostBLEKitTests: XCTestCase {
    
    func testMotorStartSpeedCommand() {
        XCTAssertEqual(MotorStartSpeedCommand(portId: 0x37, speed: 100).data,
                       Data([0x09, 0x00, 0x81, 0x37, 0x11, 0x07, 0x64, 0x64, 0x03]))
        XCTAssertEqual(MotorStartSpeedCommand(portId: 0x38, speed: -100).data,
                       Data([0x09, 0x00, 0x81, 0x38, 0x11, 0x07, 0x9c, 0x64, 0x03]))
        XCTAssertEqual(MotorStartSpeedCommand(portId: 0x01, speed: 0).data,
                       Data([0x09, 0x00, 0x81, 0x01, 0x11, 0x07, 0x00, 0x64, 0x03]))
        XCTAssertEqual(MotorStartSpeedCommand(portId: 0x02, speed: 0).data,
                       Data([0x09, 0x00, 0x81, 0x02, 0x11, 0x07, 0x00, 0x64, 0x03]))
    }
    
    func testMotorStartPowerCommand() {
        XCTAssertEqual(MotorStartPowerCommand(portId: 0x37, power: 100).data,
                       Data([0x08, 0x00, 0x81, 0x37, 0x11, 0x51, 0x00, 0x64]))
        XCTAssertEqual(MotorStartPowerCommand(portId: 0x38, power: -100).data,
                       Data([0x08, 0x00, 0x81, 0x38, 0x11, 0x51, 0x00, 0x9c]))
        XCTAssertEqual(MotorStartPowerCommand(portId: 0x01, power: 0).data,
                       Data([0x08, 0x00, 0x81, 0x01, 0x11, 0x51, 0x00, 0x00]))
        XCTAssertEqual(MotorStartPowerCommand(portId: 0x02, power: 0).data,
                       Data([0x08, 0x00, 0x81, 0x02, 0x11, 0x51, 0x00, 0x00]))
    }
    
    func testNotification() {
        XCTAssertNotNil(BoostBLEKit.Notification(data:
            Data([0x0f, 0x00, 0x04, 0x01, 0x01, 0x25, 0x00, 0x00, 0x00, 0x00, 0x10, 0x00, 0x00, 0x00, 0x10])
        ))
        XCTAssertNotNil(BoostBLEKit.Notification(data:
            Data([0x05, 0x00, 0x04, 0x02, 0x00])
        ))
    }
    
    static var allTests = [
        ("testMotorStartSpeedCommand", testMotorStartSpeedCommand),
        ("testMotorStartPowerCommand", testMotorStartPowerCommand),
        ("testNotification", testNotification),
    ]
}
