﻿# Taking a Look Inside a Package App in Swift Playgrounds

Hey there!

Ever wondered what's inside a Package App in **Swift Playgrounds**? Well, I've got something cool for you. In this [video](https://youtu.be/Q7f3Y34TvbI), I show you how to set everything up from scratch: from the `Package.swift` file to adding your own modules, and even how to do unit tests (which, for now, only work in Xcode, but let's keep our fingers crossed for Swift Playgrounds too! 🤞).

In this repo, I've laid out everything you need to know about `Package.swift`, and a bunch of other stuff. There's also a sample project and some links that could be really helpful.

Hope it helps and have as much fun as I did!

## Final version of Package.swift

```swift
// swift-tools-version: 5.9

// WARNING:
// This file is automatically generated.
// Do not edit it by hand because the contents will be replaced.

import PackageDescription
import AppleProductTypes

let package = Package(
    name: "YouTube",
    defaultLocalization: "en",
    platforms: [
        .iOS("17.0")
    ],
    products: [
        .library(
            name: "ExampleKit",
            targets: ["ExampleKit"]
        ),
        .iOSApplication(
            name: "YouTube",
            targets: ["AppModule"],
            bundleIdentifier: "com.alemohamad.YouTube",
            teamIdentifier: "YOUR-TEAM-IDENTIFIER",
            displayVersion: "1.0",
            bundleVersion: "1",
            appIcon: .asset("AppIcon"),
            accentColor: .asset("AccentColor"),
            supportedDeviceFamilies: [
                .pad,
                .phone
            ],
            supportedInterfaceOrientations: [
                .portrait,
                .landscapeRight,
                .landscapeLeft,
                .portraitUpsideDown(.when(deviceFamilies: [.pad]))
            ],
            appCategory: .education,
            additionalInfoPlistContentFilePath: "AppInfo.plist"
        )
    ],
    targets: [
        .executableTarget(
            name: "AppModule",
            dependencies: [
                "ExampleKit"
            ]
        ),
        .target(
            name: "ExampleKit"
        ),
        .testTarget(
            name: "AppModuleTest",
            dependencies: [
                "ExampleKit"
            ]
        )
    ]
)
```

**Important Note:** After completing the project, I discovered a critical issue: if `AppModule` includes the `Assets.xcassets` folder, it causes the `testTarget` to fail, breaking the entire project in Xcode. To resolve this and ensure the project functions correctly, I had to modify the dependency of the `testTarget` from `AppModule` to `ExampleKit`. And it works because `ExampleKit` contains the logic I intend to test. Everything else remains as demonstrated in the video.

## Swift Package Manager

- [Swift.org](https://docs.swift.org/package-manager/)
- [Apple Developer](https://developer.apple.com/documentation/packagedescription)
- [GitHub](https://github.com/apple/swift-package-manager/)

## [Platform](https://developer.apple.com/documentation/packagedescription/platform)

### [SupportedPlatform](https://developer.apple.com/documentation/packagedescription/supportedplatform)

```swift
platforms: [
    .iOS("17.0"),
    .macOS("14.0"),
    .watchOS("10.0"),
    .tvOS("17.0"),
    .visionOS("1.0"),
    .macCatalyst("17.0"),
    .driverKit("23.0"),
    .linux(""),
    .openbsd(""),
    .wasi(""), // WebAssembly System Interafce
    .android(""),
    .windows(""),
    .custom("")
],
```

### [iOSVersion](https://developer.apple.com/documentation/packagedescription/supportedplatform/iosversion)

```swift
.iOS("17.0")
.iOS(.v17)
.iOS("16.1")
.iOS(.v16_1) // constant doesn't work on minor versions, must use major only
```

```swift
// Swift Playgrounds supports this iOS versions:
// 17.0, 17.1, 17.2, 17.3, 17.4, 17.5
// 16.0, 16.1, 16.2, 16.3, 16.4, 16.5, 16.6
// 15.2, 15.3, 15.4, 15.5, 15.6
```

## [Product](https://developer.apple.com/documentation/packagedescription/product)

```swift
products: [
    .library(name: "", type: .dynamic, targets: []), // .static
    .executable(name: "", targets: []),
    .plugin(name: "", targets: []),
    .iOSApplication(name: "", targets: []) // only in AppleProductTypes framework
],
```

### [UIUserInterfaceIdiom](https://developer.apple.com/documentation/uikit/uiuserinterfaceidiom)

```swift
supportedDeviceFamilies: [
    .phone,
    .pad,
    .tv, // ?
    .carPlay, // ?
    .mac, // ?
    .vision, // ?
    .unspecified // ?
]
```

### [UIDeviceOrientation](https://developer.apple.com/documentation/uikit/uideviceorientation)

```swift
supportedInterfaceOrientations: [
    .portrait,
    .portraitUpsideDown,
    .landscapeRight,
    .landscapeLeft,
    .faceUp,
    .faceDown,
    .unknown
]
```

### App Icon

```swift
appIcon: .placeholder(icon: .coffee),
appIcon: .asset("AppIcon"),

// 54 icons:
// .bird         .bunny      .cat         .dog            .butterfly
// .flower       .leaf       .carrot      .bowl           .coffee
// .sandwich     .twoPeople  .running     .calendar       .camera
// .clock        .gamepad    .map         .movieReel      .palette
// .pencil       .openBook   .calculator  .images         .mic
// .box          .coins      .weights     .paper          .tv
// .binoculars   .bandage    .magicWand   .gift           .rocket
// .earth        .beachball  .barChart    .heart          .note
// .smiley       .star       .location    .lightningBolt  .checkmark
// .chatMessage  .sparkle    .bicycle     .boat           .car
// .plane        .moon       .sun         .cloud
```

### Accent Color

```swift
accentColor: .presetColor(.orange),
accentColor: .asset("AccentColor"),

// 12 colors:
// .red     .orange  .yellow
// .green   .mint    .teal
// .cyan    .blue    .indigo
// .purple  .pink    .brown
```

### App Category

```swift
.books                    // Books
.business                 // Business
.developerTools           // Developer Tools
.education                // Education
.entertainment            // Entertainment
.finance                  // Finance
.food-and-drink           // Food & Drink
.games                    // Games
.actionGames              // Games - Action Games
.adventureGames           // Games - Adventure Games
.boardGames               // Games - Board Games
.cardGames                // Games - Card Games
.casinoGames              // Games - Casino Games
.arcadeGames              // Games - Casual Games
.familyGames              // Games - Family Games
.kidsGames                // Games - Kids Games
.musicGames               // Games - Music Games
.puzzleGames              // Games - Puzzle Games
.racingGames              // Games - Racing Games
.rolePlayingGames         // Games - Role Playing Games
.simulationGames          // Games - Simulation Games
.sportsGames              // Games - Sports Games
.strategyGames            // Games - Strategy Games
.triviaGames              // Games - Trivia Games
.wordGames                // Games - Word Games
.graphicsDesign           // Graphics & Design
.healthcareFitness        // Health & Fitness
.lifestyle                // Lifestyle
.magazines-and-newspapers // Magazines & Newspapers
.medical                  // Medical
.music                    // Music
.navigation               // Navigation
.news                     // News
.photography              // Photography
.productivity             // Productivity
.reference                // Reference
.shopping                 // Shopping
.socialNetworking         // Social Networking
.sports                   // Sports
.travel                   // Travel
.utilities                // Utilities
.video                    // Video
.weather                  // Weather
```

## [Target](https://developer.apple.com/documentation/packagedescription/target)

```swift
.target(name: "")
.executableTarget(name: "")
.testTarget(name: "")
.systemLibrary(name: "")
.binaryTarget(name: "", path: "")
.plugin(name: "")
```

## Reference links

- ["Swift Playgrounds App Projects" by Aaron Sky (Nov 6, 2021)](https://skyaaron.com/posts/swiftpm-app-projects/)
- ["A document-based app in Swift Playgrounds for iPad" by Guilherme Rambo (Dec 28, 2021)](https://rambo.codes/posts/2021-12-28-a-document-based-app-in-swift-playgrounds-for-ipad)
- ["Lessons from Developing an App on the iPad in Swift Playgrounds from Start to Finish (Including Publishing on the App Store)" by Matt Waller (Jan 4, 2022)](https://www.cephalopod.studio/blog/lessons-from-developing-an-app-on-the-ipad-from-start-to-finish-on-the-app-store)
- ["Changing the Thumbnail of an App in Swift Playgrounds" by Tiago Gomes Pereira (Apr 7, 2022)](https://www.createwithswift.com/changing-the-thumbnail-of-an-app-in-swift-playgrounds/)
