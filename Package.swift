// swift-tools-version: 5.4
import PackageDescription

let package = Package(
    name: "Stylist",
    platforms: [
        .iOS(.v12)
    ],
    products: [
        .library(name: "Stylist", targets: ["Stylist"]),
    ],
     dependencies: [
        .package(url: "https://github.com/krzysztofzablocki/KZFileWatchers.git", from: "1.1.0")
    ],
    targets: [
        .target(name: "Stylist",
                path: "Stylist",
                exclude: ["Resources/Original",
                          "Resources/README.md",
                          "Resources/update_metadata.sh",
                          "Info.plist"],
                resources: [
                ]),
        .testTarget(name: "Tests",
                    dependencies: ["Stylist"],
                    path: "Tests",
                    exclude: ["Info.plist"])
    ]
)
