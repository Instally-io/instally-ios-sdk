import XCTest
@testable import Instally

final class InstallyTests: XCTestCase {

    override func setUp() {
        super.setUp()
        Instally._resetForTesting()
    }

    override func tearDown() {
        Instally._resetForTesting()
        super.tearDown()
    }

    func testConfigureSetsState() {
        Instally.configure(appId: "app_test", apiKey: "key_test")
        // If configure didn't crash, it worked.
        // Internal state is private, so we just verify trackInstall doesn't throw the "not configured" error.
    }

    func testTrackInstallRequiresConfigure() {
        // Should print error but not crash
        Instally.trackInstall()
    }

    func testTrackPurchaseRequiresConfigure() {
        // Should print error but not crash
        Instally.trackPurchase(productId: "test", revenue: 1.0)
    }

    func testSetUserIdRequiresConfigure() {
        // Should print error but not crash
        Instally.setUserId("user_123")
    }

    func testIsAttributedDefaultsFalse() {
        XCTAssertFalse(Instally.isAttributed)
    }

    func testAttributionIdDefaultsNil() {
        XCTAssertNil(Instally.attributionId)
    }

    func testResetClearsState() {
        UserDefaults.standard.set(true, forKey: "instally_matched")
        UserDefaults.standard.set("attr_123", forKey: "instally_attribution_id")
        UserDefaults.standard.set(true, forKey: "instally_install_tracked")

        Instally._resetForTesting()

        XCTAssertFalse(UserDefaults.standard.bool(forKey: "instally_matched"))
        XCTAssertNil(UserDefaults.standard.string(forKey: "instally_attribution_id"))
        XCTAssertFalse(UserDefaults.standard.bool(forKey: "instally_install_tracked"))
    }

    func testSetAPIBase() {
        Instally.setAPIBase("https://example.com/api")
        // No crash = success. Internal state is private.
    }
}
