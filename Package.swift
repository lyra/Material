// swift-tools-version: 5.6
import PackageDescription

let package = Package(
    name: "LyraMaterial",
    platforms: [
        .iOS(.v15)
    ],
    products: [
        .library(
            name: "LyraMaterial",
            targets: ["LyraMaterialTarget"]
        )
    ],
    dependencies: [
        .package(
            url: "https://github.com/lyra/Motion.git",
            exact: "4.0.6"
        )
    ],
    targets: [
        .binaryTarget(
            name: "LyraMaterial",
            url: "https://raw.githubusercontent.com/lyra/Material/1.0.12/LyraMaterial.xcframework.zip",
            checksum: "a00ce5bc7642988ddaba18aef3fe030f9af837604a35d45ca59afb909d215cb0"
        ),
        .target(
            name: "LyraMaterialTarget",
            dependencies: [
                "LyraMaterial",
                .product(name: "LyraMotion", package: "Motion")
            ]
        )
    ]
)
