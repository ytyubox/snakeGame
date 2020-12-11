// swift-tools-version:5.3

import PackageDescription

let package = Package(
    name: "SnakeCore",
    products: [
        .library(
            name: "SnakeCore",
            targets: ["SnakeCore"]),
    ],
    targets: [
        .target(
            name: "SnakeCore",
            dependencies: []),
        .testTarget(
            name: "SnakeCoreTests",
            dependencies: ["SnakeCore"]),
    ]
)
