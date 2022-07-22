// swift-tools-version: 5.5

// WARNING:
// This file is automatically generated.
// Do not edit it by hand because the contents will be replaced.

import PackageDescription
import AppleProductTypes

let package = Package(
    name: "mvpswiptetesting",
    platforms: [
        .iOS("15.2")
    ],
    products: [
        .iOSApplication(
            name: "mvpswiptetesting",
            targets: ["AppModule"],
            bundleIdentifier: "eachday.mvpswiptetesting",
            teamIdentifier: "VUFRZ947YZ",
            displayVersion: "1.0",
            bundleVersion: "1",
            iconAssetName: "AppIcon",
            accentColorAssetName: "AccentColor",
            supportedDeviceFamilies: [
                .pad,
                .phone
            ],
            supportedInterfaceOrientations: [
                .portrait,
                .landscapeRight,
                .landscapeLeft,
                .portraitUpsideDown(.when(deviceFamilies: [.pad]))
            ]
        )
    ],
    dependencies: [
        .package(url: "https://github.com/apple/swift-collections.git", "1.0.0"..<"2.0.0")
    ],
    targets: [
        .executableTarget(
            name: "AppModule",
            dependencies: [
                .product(name: "Collections", package: "swift-collections"),
                .product(name: "DequeModule", package: "swift-collections"),
                .product(name: "OrderedCollections", package: "swift-collections")
            ],
            path: "."
        )
    ]
)