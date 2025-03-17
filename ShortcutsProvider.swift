import AppIntents

@available(iOS 16.0, *)
struct TrollLEDsAppShortcutsProvider: AppShortcutsProvider {
    @AppShortcutsBuilder static var appShortcuts: [AppShortcut] {
        AppShortcut(
            intent: AmberOnIntent(),
            phrases: [
                "Turn on amber LEDs with \(.applicationName)"
            ],
            shortTitle: "开暖光",
            systemImageName: "flashlight.on.circle.fill"
        )
        AppShortcut(
            intent: WhiteOnIntent(),
            phrases: [
                "Turn on white LEDs with \(.applicationName)"
            ],
            shortTitle: "开冷光",
            systemImageName: "flashlight.on.circle.fill"
        )
        AppShortcut(
            intent: AllOnIntent(),
            phrases: [
                "Turn on all LEDs with \(.applicationName)"
            ],
            shortTitle: "全开",
            systemImageName: "flashlight.on.circle.fill"
        )
        AppShortcut(
            intent: AllOffIntent(),
            phrases: [
                "Turn off all LEDs with \(.applicationName)"
            ],
            shortTitle: "全关",
            systemImageName: "flashlight.off.circle.fill"
        )
        AppShortcut(
            intent: ManualIntent(),
            phrases: [
                "Configure LEDs levels manually with \(.applicationName)"
            ],
            shortTitle: "手动",
            systemImageName: "flashlight.on.circle.fill"
        )
    }
}
