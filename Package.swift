// swift-tools-version:4.0
import PackageDescription

let package = Package(
    name: "StringUtils",
    products: [
        .library(name: "StringUtils", targets: ["StringUtils"]),
    ],
    dependencies: [
    ],
    targets: [
        .target(name: "StringUtils"),
    ]
)
