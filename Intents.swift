import AppIntents
import UIKit

@available(iOS 16.0, *)
struct AmberOnIntent: AppIntent {
    static let title: LocalizedStringResource = "开暖光"
    static let description = IntentDescription(
        "打开所有暖光LED",
        categoryName: "Device"
    )
    static let openAppWhenRun: Bool = true

    func perform() async throws -> some IntentResult {
        if let url = URL(string: "leds://com.ps.TrollLEDs.AmberOn") {
            if await UIApplication.shared.canOpenURL(url) {
                await UIApplication.shared.open(url)
            }
        }
        return .result()
    }
}

@available(iOS 16.0, *)
struct WhiteOnIntent: AppIntent {
    static let title: LocalizedStringResource = "开冷光"
    static let description = IntentDescription(
        "打开所有冷光LED",
        categoryName: "Device"
    )
    static let openAppWhenRun: Bool = true

    func perform() async throws -> some IntentResult {
        if let url = URL(string: "leds://com.ps.TrollLEDs.WhiteOn") {
            if await UIApplication.shared.canOpenURL(url) {
                await UIApplication.shared.open(url)
            }
        }
        return .result()
    }
}

@available(iOS 16.0, *)
struct AllOnIntent: AppIntent {
    static let title: LocalizedStringResource = "全开"
    static let description = IntentDescription(
        "打开所有LED",
        categoryName: "Device"
    )
    static let openAppWhenRun: Bool = true

    func perform() async throws -> some IntentResult {
        if let url = URL(string: "leds://com.ps.TrollLEDs.AllOn") {
            if await UIApplication.shared.canOpenURL(url) {
                await UIApplication.shared.open(url)
            }
        }
        return .result()
    }
}

@available(iOS 16.0, *)
struct AllOffIntent: AppIntent {
    static let title: LocalizedStringResource = "全关"
    static let description = IntentDescription(
        "关闭所有LED",
        categoryName: "Device"
    )
    static let openAppWhenRun: Bool = true

    func perform() async throws -> some IntentResult {
        if let url = URL(string: "leds://com.ps.TrollLEDs.AllOff") {
            if await UIApplication.shared.canOpenURL(url) {
                await UIApplication.shared.open(url)
            }
        }
        return .result()
    }
}

@available(iOS 16.0, *)
struct ManualIntent: AppIntent {
    static let title: LocalizedStringResource = "手动"
    static let description = IntentDescription(
        "手动配置LED亮度(0-255)(仅适用于四LED设备)",
        categoryName: "Device"
    )
    static let openAppWhenRun: Bool = true

    @Parameter(title: "冷光LED 0", inclusiveRange: (0, 255))
    var coolLED0: Int

    @Parameter(title: "冷光LED 1", inclusiveRange: (0, 255))
    var coolLED1: Int

    @Parameter(title: "暖光LED 0", inclusiveRange: (0, 255))
    var warmLED0: Int

    @Parameter(title: "暖光LED 1", inclusiveRange: (0, 255))
    var warmLED1: Int
    
    static var parameterSummary: some ParameterSummary {
        Summary("将LED亮度配置为 (\(\.$coolLED0), \(\.$coolLED1), \(\.$warmLED0), \(\.$warmLED1))")
    }

    func perform() async throws -> some IntentResult {
        if let url = URL(string: "leds://com.ps.TrollLEDs.Manual?coolLED0=\(coolLED0)&coolLED1=\(coolLED1)&warmLED0=\(warmLED0)&warmLED1=\(warmLED1)") {
            if await UIApplication.shared.canOpenURL(url) {
                await UIApplication.shared.open(url)
            }
        }
        return .result()
    }
}
