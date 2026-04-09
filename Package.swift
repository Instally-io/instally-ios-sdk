// swift-tools-version: 5.9

import PackageDescription

let package = Package(
    name: "Instally",
    platforms: [
        .iOS(.v14)
    ],
    products: [
        .library(
            name: "Instally",
            targets: ["Instally"]
        ),
    ],
    targets: [
        .target(
            name: "Instally",
            path: "Sources/Instally"
        ),
        .testTarget(
            name: "InstallyTests",
            dependencies: ["Instally"],
            path: "Tests/InstallyTests"
        ),
    ]
)
