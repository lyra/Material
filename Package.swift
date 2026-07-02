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
            exact: "4.0.5"
        )
    ],
    targets: [
        .binaryTarget(
            name: "LyraMaterial",
            url: "https://raw.githubusercontent.com/lyra/Material/1.0.11/LyraMaterial.xcframework.zip",
            checksum: "8e96770fd7377348d869fc5c25c7745ce1470994848b52f13a70a2d32504add9"
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
