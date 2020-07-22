// swift-tools-version:4.1
import PackageDescription

let package = Package(
    name: "config4beveilig",
    products: [
        .library(name: "config4beveilig", targets: ["App"]),
    ],
    dependencies: [
        // 💧 A server-side Swift web framework.
        .package(url: "https://github.com/vapor/vapor.git", from: "3.0.0"),

        // 🔵 Swift ORM (queries, models, relations, etc) built on SQLite 3.
        .package(url: "https://github.com/vapor/fluent-sqlite.git", from: "3.0.0"),

        // Leaf
        .package(url: "https://github.com/vapor/leaf.git", from: "3.0.0"),
        
        // MollieKit
        .package(url: "https://github.com/biutthapa/MollieKit", from: "0.0.1"),
    ],
    targets: [
        .target(name: "App", dependencies: ["FluentSQLite", "Vapor", "Leaf", "MollieKit"]),
        .target(name: "Run", dependencies: ["App"]),
        .testTarget(name: "AppTests", dependencies: ["App"])
    ]
)
