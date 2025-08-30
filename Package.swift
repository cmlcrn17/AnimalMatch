// swift-tools-version:5.7
import PackageDescription

let package = Package(
    name: "AnimalMatch",
    platforms: [
        .iOS(.v15)
    ],
    products: [
        .library(
            name: "AnimalMatch",
            targets: ["AnimalMatch"])
    ],
    targets: [
        .target(
            name: "AnimalMatch",
            path: "AnimalMatch",
            resources: [.process("Resources")]
        )
    ]
)
