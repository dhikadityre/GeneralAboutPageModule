// swift-tools-version: 6.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "GeneralAboutPageModule",
    platforms: [
        .iOS(.v13)
    ],
    products: [
        .library(
            name: "GeneralAboutPageModule",
            targets: ["GeneralAboutPageModule"]
        ),
    ],
    dependencies: [
        .package(path: "../../Module/AlgoreadMePackageData")
    ],
    targets: [
        .target(
            name: "GeneralAboutPageModule",
            dependencies: [
                "AlgoreadMePackageData"
            ],
            path: "Sources/GeneralAboutPageModule"
        ),
        .testTarget(
            name: "GeneralAboutPageModuleTests",
            dependencies: ["GeneralAboutPageModule"]
        ),
    ]
)
